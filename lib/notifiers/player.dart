import 'dart:collection';
import 'package:app_music/model/song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<PlayerNotifier, PlayerNotifierState>
    playerNotifierProvider =
    StateNotifierProvider<PlayerNotifier, PlayerNotifierState>(
  (ref) => PlayerNotifier(ref),
);

class PlayerNotifier extends StateNotifier<PlayerNotifierState> {
  final Ref ref;

  PlayerNotifier(this.ref) : super(PlayerNotifierState.initial());

  final List<SongModel> _songs = [];

  UnmodifiableListView<SongModel> get songs => UnmodifiableListView(_songs);

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> initialize() async {
    final QuerySnapshot<Map<String, dynamic>> results =
        await FirebaseFirestore.instance.collection('music').get();

    _songs.clear();

    for (final QueryDocumentSnapshot<Map<String, dynamic>> song
        in results.docs) {
      _songs.add(await SongModel.fromJson(song.data(), song.id));
    }

    await changeVolume(0.25);

    state = state.copyWith(isInitializing: false);

    _audioPlayer.onPlayerStateChanged.listen((PlayerState newState) {
      if (newState == PlayerState.paused) {
        state = state.copyWith(isPlaying: false);
      } else if (newState == PlayerState.playing) {
        state = state.copyWith(isPlaying: true);
      } else if (newState == PlayerState.stopped) {
        state = state.copyWith(isPlaying: false);
      } else if (newState == PlayerState.completed) {
        skipForward();
      }
    });
  }

  Future<void> changeVolume(double volume) async {
    state = state.copyWith(volume: volume);
    await _audioPlayer.setVolume(volume);
  }

  Future<void> playSong(String songId) async {
    state = state.copyWith(
      isPlaying: false,
      currentSong: _songs.firstWhere((song) => song.songId == songId),
    );

    await _audioPlayer.setSourceUrl(
        _songs.firstWhere((song) => song.songId == songId).audioUrl);

    await _audioPlayer.play(_audioPlayer.source!);

    state = state.copyWith(
      isPlaying: true,
    );

    _audioPlayer.onPositionChanged.listen((Duration duration) {
      // Ignore if we are going to make the same state change.
      if (state.elapsedSeconds == duration.inSeconds) {
        return;
      }

      state = state.copyWith(elapsedSeconds: duration.inSeconds);
    });
  }

  Future<void> pauseSong() async {
    await _audioPlayer.pause();
    state = state.copyWith(isPlaying: false);
  }

  Future<void> resumeSong() async {
    await _audioPlayer.play(_audioPlayer.source!);
    state = state.copyWith(isPlaying: true);
  }

  Future<void> skipForward() async {
    final int nextSongIndex =
        _songs.indexWhere((song) => song.songId == state.currentSong!.songId) +
            1;

    if (nextSongIndex < _songs.length) {
      await playSong(_songs[nextSongIndex].songId);
    } else {
      await playSong(_songs.first.songId);
    }
  }

  Future<void> skipBackward() async {
    final int previousSongIndex =
        _songs.indexWhere((song) => song.songId == state.currentSong!.songId) -
            1;

    if (previousSongIndex >= 0) {
      await playSong(_songs[previousSongIndex].songId);
    } else {
      await playSong(_songs.last.songId);
    }
  }

  Future<void> seekTo(int seconds) async {
    await _audioPlayer.seek(Duration(seconds: seconds));
  }
}

class PlayerNotifierState {
  final bool isPlaying;
  final bool isInitializing;
  final int elapsedSeconds;
  final SongModel? currentSong;
  final double volume;

  const PlayerNotifierState({
    this.isPlaying = false,
    this.isInitializing = true,
    this.elapsedSeconds = 0,
    this.currentSong,
    this.volume = 0.0,
  });

  factory PlayerNotifierState.initial() => const PlayerNotifierState();

  PlayerNotifierState copyWith({
    bool? isPlaying,
    bool? isInitializing,
    int? elapsedSeconds,
    SongModel? currentSong,
    double? volume,
  }) {
    return PlayerNotifierState(
      isPlaying: isPlaying ?? this.isPlaying,
      isInitializing: isInitializing ?? this.isInitializing,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      currentSong: currentSong ?? this.currentSong,
      volume: volume ?? this.volume,
    );
  }
}
