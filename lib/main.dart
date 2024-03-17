import 'package:app_music/colors.dart';
import 'package:app_music/layouts/music_controls.dart';
import 'package:app_music/layouts/sidebar.dart';
import 'package:app_music/firebase_options.dart';
import 'package:app_music/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int smallSize = 1000;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: EntrypointApp()));
}

class EntrypointApp extends StatelessWidget {
  const EntrypointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: 'NotoSans',
        scaffoldBackgroundColor: AppColors.dark2,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: null,
        body: Stack(
          fit: StackFit.loose,
          children: [
            Row(
              children: [
                if (MediaQuery.of(context).size.width > smallSize)
                  const Expanded(child: SidebarComponent()),
                const Expanded(flex: 5, child: HomeScreen()),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: MusicPlayerControlsComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
