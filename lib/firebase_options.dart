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
    appId: '1:347571404214:android:7bb7c6a6d4ea31f5cb1517',
    messagingSenderId: '347571404214',
    projectId: 'patdeployments',
    databaseURL:
        'https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'patdeployments.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2JZgdt5iAOsRL1n-WCJxglrvsV92hMK8',
    appId: '1:347571404214:ios:f33a8b581ed7612ccb1517',
    messagingSenderId: '347571404214',
    projectId: 'patdeployments',
    databaseURL:
        'https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'patdeployments.appspot.com',
    iosClientId:
        '347571404214-f7171k0pp7nglq7g2d2s698dfge29p79.apps.googleusercontent.com',
    iosBundleId: 'veris.sashklym',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2JZgdt5iAOsRL1n-WCJxglrvsV92hMK8',
    appId: '1:347571404214:ios:3738ba3741294367cb1517',
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
