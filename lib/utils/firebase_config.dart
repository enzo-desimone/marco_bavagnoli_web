import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions? get platformOptions {
    if (kIsWeb) {
      return const FirebaseOptions(
          apiKey: "AIzaSyAd-sfy0sme5bFPIINJHHNYk0RSMPyhZuM",
          authDomain: "marco-bavagnoli-web.firebaseapp.com",
          projectId: "marco-bavagnoli-web",
          storageBucket: "marco-bavagnoli-web.appspot.com",
          messagingSenderId: "864087228717",
          appId: "1:864087228717:web:8dc1a94f568ef768dc13a4",
          measurementId: "G-DQ9NPQCSW2");
    } else if (Platform.isIOS || Platform.isMacOS) {
      return const FirebaseOptions(
        appId: '1:545282561082:web:cde3f644ec64f5ea41d103',
        apiKey: 'AIzaSyDOuGq4CLdTwO_qucJ4BLPAEsdaWpSBFwU',
        projectId: 'off-road-lab-web',
        messagingSenderId: '545282561082',
        iosBundleId: 'com.invertase.testing',
        iosClientId:
            '448618578101-28tsenal97nceuij1msj7iuqinv48t02.apps.googleusercontent.com',
        androidClientId:
            '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
        storageBucket: 'react-native-firebase-testing.appspot.com',
      );
    } else {
      log("Analytics Dart-only initializer doesn't work on Android, please make sure to add the config file.");
      return null;
    }
  }
}
