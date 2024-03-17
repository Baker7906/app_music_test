import 'package:firebase_storage/firebase_storage.dart';

class SongModel {
  final String songName;
  final String songArtist;
  final int songDurationSeconds;
  final String songId;
  final bool isFavorite;
  final String thumbnailUrl;
  final String audioUrl;

  const SongModel({
    required this.songName,
    required this.songArtist,
    required this.songDurationSeconds,
    required this.songId,
    required this.thumbnailUrl,
    required this.audioUrl,
    this.isFavorite = false,
  });

  static Future<SongModel> fromJson(
      Map<String, dynamic> json, String documentId) async {
    final String thumbnailUrl = await FirebaseStorage.instance
        .ref('thumbnails/$documentId.jpg')
        .getDownloadURL();

    final String audioUrl = await FirebaseStorage.instance
        .ref('audio/$documentId.mp3')
        .getDownloadURL();

    return SongModel(
      songName: json['name'] as String,
      songArtist: json['artist'] as String,
      songDurationSeconds: json['duration'] as int,
      thumbnailUrl: thumbnailUrl,
      audioUrl: audioUrl,
      songId: documentId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': songName,
      'artist': songArtist,
      'duration': songDurationSeconds,
      'thumbnailUrl': thumbnailUrl,
      'audioUrl': audioUrl,
    };
  }
}
