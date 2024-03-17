import 'dart:math';

import 'package:app_music/colors.dart';
import 'package:app_music/main.dart';
import 'package:flutter/material.dart';

class MixTileComponent extends StatefulWidget {
  final String mixName;
  final String title;

  const MixTileComponent({
    super.key,
    required this.mixName,
    required this.title,
  });

  @override
  State<MixTileComponent> createState() => _MixTileComponentState();
}

class _MixTileComponentState extends State<MixTileComponent> {
  List<Color> colors = [
    const Color(0xFF120D21),
    const Color(0xFF3F2C48),
    const Color(0xFF63464E),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<Color> newColors = [];

      for (int i = 0; i < colors.length; i++) {
        final Random random = Random();

        // Each color can appear up to 3 times randomly.
        final int count = random.nextInt(3) + 1;

        for (int j = 0; j < count; j++) {
          newColors.add(colors[i]);
        }
      }

      // We will randomize the order of [newColors] list.
      newColors.shuffle();

      setState(() {
        colors.clear();
        colors.addAll(newColors);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.width > smallSize ? 180 : 120,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.mixName,
                  style: const TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                splashRadius: 20,
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.grey2,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: AppColors.grey2,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
