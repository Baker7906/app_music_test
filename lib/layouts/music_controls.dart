import 'dart:ui';
import 'package:app_music/colors.dart';
import 'package:app_music/duration.dart';
import 'package:app_music/main.dart';
import 'package:app_music/notifiers/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicPlayerControlsComponent extends ConsumerStatefulWidget {
  const MusicPlayerControlsComponent({super.key});

  @override
  ConsumerState<MusicPlayerControlsComponent> createState() =>
      _MusicPlayerControlsComponentState();
}

class _MusicPlayerControlsComponentState
    extends ConsumerState<MusicPlayerControlsComponent> {
  bool _isExpanded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(playerNotifierProvider.notifier).initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer(
      builder: (_, ref, __) {
        final PlayerNotifierState playerState =
            ref.watch(playerNotifierProvider);
        final PlayerNotifier playerNotifier =
            ref.watch(playerNotifierProvider.notifier);

        if (_isExpanded && playerState.currentSong == null) {
          _isExpanded = false;
        }

        return Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 20, sigmaY: 15, tileMode: TileMode.clamp),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOutCubic,
                  child: SizedBox(
                    height: size.width > smallSize
                        ? (_isExpanded ? 300 : 100)
                        : 150,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15) /
                            (size.width > smallSize ? 1 : 2),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: playerState.currentSong != null ? 1 : 0.5,
                          child: IgnorePointer(
                            ignoring: playerState.currentSong == null,
                            child: size.width <= smallSize
                                ? Column(
                                    children: [
                                      _MusicInfo(
                                        isExpanded: _isExpanded,
                                        onExpandedChanged: (bool newState) =>
                                            setState(
                                                () => _isExpanded = newState),
                                      ),
                                      const SizedBox(height: 15),
                                      const _MusicControls(),
                                    ],
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (_isExpanded) ...[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 25),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: GestureDetector(
                                                onTap: () => setState(() =>
                                                    _isExpanded = !_isExpanded),
                                                child: Image.network(
                                                  playerState.currentSong!
                                                      .thumbnailUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: _MusicInfo(
                                              isExpanded: _isExpanded,
                                              onExpandedChanged:
                                                  (bool newState) => setState(
                                                      () => _isExpanded =
                                                          newState),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          const Expanded(
                                            flex: 3,
                                            child: _MusicControls(),
                                          ),
                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    playerNotifier.changeVolume(
                                                        playerState.volume ==
                                                                0.0
                                                            ? 0.25
                                                            : 0.0);
                                                  },
                                                  icon: Icon(
                                                    playerState.volume == 0.0
                                                        ? Icons
                                                            .volume_off_rounded
                                                        : Icons
                                                            .volume_up_rounded,
                                                    color: AppColors.grey2,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Flexible(
                                                  child: Container(
                                                    height: 3,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.grey1
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  5)),
                                                      child:
                                                          LinearProgressIndicator(
                                                        value:
                                                            playerState.volume,
                                                        valueColor:
                                                            const AlwaysStoppedAnimation(
                                                                AppColors
                                                                    .grey2),
                                                        backgroundColor:
                                                            AppColors.grey1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MusicInfo extends StatelessWidget {
  final bool isExpanded;
  final Function(bool newState) onExpandedChanged;

  const _MusicInfo({
    required this.isExpanded,
    required this.onExpandedChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer(
      builder: (_, ref, __) {
        final PlayerNotifierState playerState =
            ref.watch(playerNotifierProvider);

        return Row(
          children: [
            if (!isExpanded || size.width <= smallSize)
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: (playerState.currentSong?.thumbnailUrl != null)
                      ? GestureDetector(
                          onTap: () => onExpandedChanged(!isExpanded),
                          child: Image.network(
                            playerState.currentSong!.thumbnailUrl,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          height: 60,
                          width: 60,
                          color: AppColors.grey1,
                          child: const Icon(
                            Icons.music_note_outlined,
                            color: AppColors.grey2,
                            size: 30,
                          ),
                        ),
                ),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (playerState.currentSong != null)
                    Text(
                      playerState.currentSong!.songName,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey2,
                      ),
                    )
                  else
                    Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  const SizedBox(height: 5),
                  if (playerState.currentSong != null)
                    Text(
                      playerState.currentSong!.songArtist,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey1,
                      ),
                    )
                  else
                    Container(
                      height: 15,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class _MusicControls extends StatelessWidget {
  const _MusicControls();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final PlayerNotifier playerNotifier =
            ref.watch(playerNotifierProvider.notifier);
        final PlayerNotifierState playerState =
            ref.watch(playerNotifierProvider);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (playerState.currentSong != null)
                  Text(
                    secondsToMinutes(playerState.elapsedSeconds),
                    style:
                        const TextStyle(color: AppColors.grey2, fontSize: 12),
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          splashRadius: 5,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(
                            Icons.shuffle_rounded,
                            color: AppColors.grey2,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () => playerNotifier.skipForward(),
                          splashRadius: 5,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(
                            Icons.skip_previous_rounded,
                            color: AppColors.grey2,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            if (playerState.isPlaying) {
                              playerNotifier.pauseSong();
                            } else {
                              playerNotifier
                                  .playSong(playerState.currentSong!.songId);
                            }
                          },
                          splashRadius: 5,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: Icon(
                            playerState.isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: AppColors.grey2,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () => playerNotifier.skipForward(),
                          splashRadius: 5,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(
                            Icons.skip_next_rounded,
                            color: AppColors.grey2,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {},
                          splashRadius: 5,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(
                            Icons.repeat_rounded,
                            color: AppColors.grey2,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (playerState.currentSong != null)
                  Text(
                    secondsToMinutes(
                        playerState.currentSong!.songDurationSeconds),
                    style:
                        const TextStyle(color: AppColors.grey2, fontSize: 12),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey1.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: LinearProgressIndicator(
                  value: playerState.currentSong == null
                      ? 0
                      : playerState.elapsedSeconds /
                          playerState.currentSong!.songDurationSeconds,
                  valueColor: const AlwaysStoppedAnimation(AppColors.grey2),
                  backgroundColor: AppColors.grey1,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
