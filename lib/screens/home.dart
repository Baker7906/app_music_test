import 'package:app_music/colors.dart';
import 'package:app_music/components/mix_tile.dart';
import 'package:app_music/components/music_tile.dart';
import 'package:app_music/main.dart';
import 'package:app_music/notifiers/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer(
      builder: (_, ref, __) {
        final PlayerNotifier playerNotifier =
            ref.watch(playerNotifierProvider.notifier);
        ref.watch(playerNotifierProvider);

        return Column(
          children: [
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (size.width <= smallSize)
                      const Expanded(
                        child: Text(
                          'Rhythmics',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey2,
                          ),
                        ),
                      ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: AppColors.grey2,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1595152452543-e5fc28ebc2b8?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                      backgroundColor: AppColors.grey1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: size.width > smallSize
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20),
                        )
                      : null,
                  color: AppColors.dark1,
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flex(
                        direction: size.width > smallSize
                            ? Axis.horizontal
                            : Axis.vertical,
                        children: const [
                          MixTileComponent(
                            mixName: 'Mix for you',
                            title: 'Night meetings',
                          ),
                          MixTileComponent(
                            mixName: 'Mix o.ahisaqw',
                            title: 'Road Trip',
                          ),
                          MixTileComponent(
                            mixName: 'Our mix',
                            title: 'Feel Good',
                          ),
                        ].map((e) {
                          final Padding child = Padding(
                            padding: EdgeInsets.only(
                              right: size.width > smallSize ? 20 : 0,
                              bottom: size.width > smallSize ? 0 : 20,
                            ),
                            child: e,
                          );

                          if (size.width > smallSize) {
                            return Expanded(child: child);
                          } else {
                            return child;
                          }
                        }).toList(),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'My Playlist',
                        style: TextStyle(
                          color: AppColors.grey2,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...playerNotifier.songs
                          .map((song) => MusicTileComponent(song: song)),
                      SizedBox(height: size.width > smallSize ? 100 : 150),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
