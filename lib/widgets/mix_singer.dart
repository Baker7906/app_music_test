import 'package:flutter/material.dart';

class MixSinger extends StatelessWidget{
  const MixSinger({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
           Color.fromARGB(214, 250, 173, 101),
            Color.fromARGB(255, 80, 1, 149),
            Color.fromARGB(255, 80, 1, 149),
            Color.fromARGB(255, 136, 44, 217),
            Color.fromARGB(255, 176, 4, 255),
            Color.fromARGB(255, 70, 27, 86),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  "Mix o.ahisqw ",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.play_arrow))),
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              "Road Trip",
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}