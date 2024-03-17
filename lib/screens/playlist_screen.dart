import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                padding: EdgeInsets.symmetric(vertical: 0),
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
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  "BigSam",
                  style: TextStyle(
                    color: Color.fromARGB(212, 255, 255, 255),
                    fontSize: 14,
                  ),
                ),
              )
            ]),
            const Spacer(),
            const Text(
              "3:33",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        const SizedBox(width: 5),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/borkan.jpg',
                alignment: Alignment.centerRight,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  "Borkan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  "BigSam",
                  style: TextStyle(
                    color: Color.fromARGB(212, 255, 255, 255),
                    fontSize: 14,
                  ),
                ),
              )
            ]),
            const Spacer(),
            const Text(
              "3:33",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ),
      ],
    );
  }
}
