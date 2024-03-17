// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDsrP7o07rBRvGiNpjZDWs0XcIfAU3_SgM',
    appId: '1:783687817005:web:f6ec40004e394292a525a4',
    messagingSenderId: '783687817005',
    projectId: 'music-app-a56e3',
    authDomain: 'music-app-a56e3.firebaseapp.com',
    storageBucket: 'music-app-a56e3.appspot.com',
    measurementId: 'G-M87YRT41QD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBBJe-_hGn2vLYUCTx32tfqcgBIQca6lU',
    appId: '1:783687817005:android:846832f638faf0dba525a4',
    messagingSenderId: '783687817005',
    projectId: 'music-app-a56e3',
    storageBucket: 'music-app-a56e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjhAB9djqrqz8zZfR5tIAYBVn-Kv23lF8',
    appId: '1:783687817005:ios:fd90c62d611bf949a525a4',
    messagingSenderId: '783687817005',
    projectId: 'music-app-a56e3',
    storageBucket: 'music-app-a56e3.appspot.com',
    iosBundleId: 'com.example.appMusic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjhAB9djqrqz8zZfR5tIAYBVn-Kv23lF8',
    appId: '1:783687817005:ios:43298bf7eea85e02a525a4',
    messagingSenderId: '783687817005',
    projectId: 'music-app-a56e3',
    storageBucket: 'music-app-a56e3.appspot.com',
    iosBundleId: 'com.example.appMusic.RunnerTests',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCBBJe-_hGn2vLYUCTx32tfqcgBIQca6lU',
    appId: '1:783687817005:windows:846832f638faf0dba525a4',
    messagingSenderId: '783687817005',
    projectId: 'music-app-a56e3',
    storageBucket: 'music-app-a56e3.appspot.com',
  );
}