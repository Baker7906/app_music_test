import 'package:app_music/widgets/mix_for_you.dart';
import 'package:app_music/widgets/mix_singer.dart';
import 'package:app_music/widgets/our_mix.dart';
import 'package:flutter/material.dart';
import 'package:app_music/screens/playlist_screen.dart';

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1150,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 25, 25, 25),
              Color.fromARGB(255, 25, 25, 25),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: Row(
                  children: [
                    MixForYou(),
                    SizedBox(
                      width: 120,
                    ),
                    MixSinger(),
                    SizedBox(
                      width: 120,
                    ),
                    OurMix(),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                children: [
                  const Text(
                    "My Playlist",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child:PlaylistScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
