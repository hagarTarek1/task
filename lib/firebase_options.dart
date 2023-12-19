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
    apiKey: 'AIzaSyBbwu35xBr2-srT7d5ISmy_uyWAZKTHmf4',
    appId: '1:33573769128:web:57c2607daa9eafa858979d',
    messagingSenderId: '33573769128',
    projectId: 'e-commerce-3bd59',
    authDomain: 'e-commerce-3bd59.firebaseapp.com',
    storageBucket: 'e-commerce-3bd59.appspot.com',
    measurementId: 'G-1SRGH5TQMF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6GpaPe7JAMDzbjQ9G27caX5rED3g7zKI',
    appId: '1:33573769128:android:c8ebfc3190e61b2358979d',
    messagingSenderId: '33573769128',
    projectId: 'e-commerce-3bd59',
    storageBucket: 'e-commerce-3bd59.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKTirEpl2pAZCvSl0gYPckvOT1AOrObww',
    appId: '1:33573769128:ios:129f99a29878359558979d',
    messagingSenderId: '33573769128',
    projectId: 'e-commerce-3bd59',
    storageBucket: 'e-commerce-3bd59.appspot.com',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKTirEpl2pAZCvSl0gYPckvOT1AOrObww',
    appId: '1:33573769128:ios:491235d276fa130358979d',
    messagingSenderId: '33573769128',
    projectId: 'e-commerce-3bd59',
    storageBucket: 'e-commerce-3bd59.appspot.com',
    iosBundleId: 'com.example.task.RunnerTests',
  );
}
