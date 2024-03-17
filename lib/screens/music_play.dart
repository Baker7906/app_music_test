import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:audioplayers/audioplayers.dart';

class MusicPlays extends StatefulWidget {
  const MusicPlays({super.key});

  @override
  State<MusicPlays> createState() => _MusicPlaysState();
}

class _MusicPlaysState extends State<MusicPlays> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(112, 15, 15, 15),
            Color.fromARGB(51, 16, 15, 15),
            Color.fromARGB(60, 60, 60, 60),
            Color.fromARGB(115, 15, 15, 15),
            Color.fromARGB(112, 15, 15, 15),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/law-mara-bas.png',
                    alignment: Alignment.centerRight,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(width: 10),
                const Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "لو مرة بس",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      "BigSam",
                      style: TextStyle(
                        color: Color.fromARGB(212, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Center(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shuffle),
                  iconSize: 24,
                ),
                const SizedBox(
                  width: 25,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 24,
                ),
                const SizedBox(
                  width: 25,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 24,
                ),
                const SizedBox(
                  width: 25,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next),
                  iconSize: 24,
                ),
                const SizedBox(
                  width: 25,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.repeat_rounded),
                  iconSize: 24,
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_up_outlined,
              ),
              iconSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
