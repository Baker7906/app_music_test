import 'package:app_music/colors.dart';
import 'package:app_music/duration.dart';
import 'package:app_music/main.dart';
import 'package:app_music/model/song.dart';
import 'package:app_music/notifiers/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicTileComponent extends StatefulWidget {
  final SongModel song;

  const MusicTileComponent({
    super.key,
    required this.song,
  });

  @override
  State<MusicTileComponent> createState() => _MusicTileComponentState();
}

class _MusicTileComponentState extends State<MusicTileComponent> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer(
      builder: (_, ref, __) {
        final PlayerNotifier playerNotifier =
            ref.watch(playerNotifierProvider.notifier);
        final PlayerNotifierState playerState =
            ref.watch(playerNotifierProvider);

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(widget.song.thumbnailUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: AnimatedOpacity(
                    opacity: _isHovering ? 0.8 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: InkWell(
                      onTap: () {
                        if (playerState.isPlaying &&
                            playerState.currentSong?.songId ==
                                widget.song.songId) {
                          playerNotifier.pauseSong();
                        } else {
                          playerNotifier.playSong(widget.song.songId);
                        }
                      },
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.dark1,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Icon(
                            playerState.isPlaying &&
                                    playerState.currentSong?.songId ==
                                        widget.song.songId
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: AppColors.grey2,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.song.songName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                          color: AppColors.grey2,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2.5),
                      Text(
                        widget.song.songArtist,
                        style: const TextStyle(
                          color: AppColors.grey1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  secondsToMinutes(widget.song.songDurationSeconds),
                  style: const TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 20),
                if (size.width > smallSize) ...[
                  IconButton(
                    onPressed: () {},
                    splashRadius: 20,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      widget.song.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.grey2,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                IconButton(
                  onPressed: () {},
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  icon: Icon(
                    size.width > smallSize
                        ? Icons.more_horiz_rounded
                        : Icons.more_vert_rounded,
                    color: AppColors.grey2,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
