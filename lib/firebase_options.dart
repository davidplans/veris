// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'package:firebase_core/firebase_core.dart';

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
///

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCf_0n4ehVdWJwQ4qPT4Abu-dzB_cFipCQ',
    appId: '1:347571404214:web:260485014dcd4431cb1517',
    messagingSenderId: '347571404214',
    projectId: 'patdeployments',
    authDomain: 'patdeployments.firebaseapp.com',
    databaseURL:
        'https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'patdeployments.appspot.com',
    measurementId: 'G-PT10DRKY56',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUiJCbmUZAyIx2Vgtc-PK6O9ria8CdgGA',
    appId: '1:347571404214:android:1057852394141df2cb1517',
    messagingSenderId: '347571404214',
    projectId: 'patdeployments',
    databaseURL:
        'https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'patdeployments.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2JZgdt5iAOsRL1n-WCJxglrvsV92hMK8',
    appId: '1:347571404214:ios:f38a4446b58dcd47cb1517',
    messagingSenderId: '347571404214',
    projectId: 'patdeployments',
    databaseURL:
        'https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'patdeployments.appspot.com',
    iosClientId:
        '347571404214-0lvnn0gdem1l24i7c04kg4b1aggkdh5s.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSchemaHealth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2JZgdt5iAOsRL1n-WCJxglrvsV92hMK8',
    appId: '1:347571404214:ios:f38a4446b58dcd47cb1517',
    messagingSenderId: '347571404214',
    projectId: 'patdeployments',
    databaseURL:
        'https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'patdeployments.appspot.com',
    iosClientId:
        '347571404214-0lvnn0gdem1l24i7c04kg4b1aggkdh5s.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSchemaHealth',
  );
}
