import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String backgroundImage =
      "https://images.pexels.com/photos/164829/pexels-photo-164829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  final String leftIcon =
      "https://cdn.discordapp.com/attachments/1017531658028728363/1212825027070656552/Group_1.png?ex=65f33e53&is=65e0c953&hm=2354e241f5e5805b169aa855baf7c633ca4636e4bc5c09af548cdefdbe7056c6&";
  final String instagramIcon =
      "https://cdn.discordapp.com/attachments/1017531658028728363/1213040068114120715/Group.png?ex=65f40699&is=65e19199&hm=682c9b6e26d07071bd55aa54fc94fe5700eefa3f15bac60135931bf4644070a9&";
  final String facebookIcon =
      "https://cdn.discordapp.com/attachments/1017531658028728363/1213040067610943488/Vector-1.png?ex=65f40699&is=65e19199&hm=4ce147f9150fb4cbad7952efbc59649de97c917e399930ecf3a72c662fe9f50a&";
  final String twitterIcon =
      "https://cdn.discordapp.com/attachments/1017531658028728363/1213040067921055744/Vector-2.png?ex=65f40699&is=65e19199&hm=09f468969c997e81399a089884c0c7b49374a84cf939281ad37cd98b684a26c9&";
  final String youtubeIcon =
      "https://cdn.discordapp.com/attachments/1017531658028728363/1213040067363209286/Vector.png?ex=65f40699&is=65e19199&hm=caa4aadc22d0cc1e8534c606c719cecc37720161de4773c7d039f51ea2737a4b&";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(onTap: () {}, child: Image.network(leftIcon)),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text("Home",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                  TextButton(
                      onPressed: () {},
                      child: const Text("About",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Products",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Contact",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Image.network(facebookIcon,
                                width: 30, height: 30)),
                        InkWell(
                            onTap: () {},
                            child: Image.network(instagramIcon,
                                width: 30, height: 30)),
                        InkWell(
                            onTap: () {},
                            child: Image.network(twitterIcon,
                                width: 30, height: 30)),
                        InkWell(
                            onTap: () {},
                            child: Image.network(youtubeIcon,
                                width: 30, height: 30)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "We Bring The Music",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(216, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200, // Adjust the width as needed
                    height: 50, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: null, // Add your function here
                      child: Text("data"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}