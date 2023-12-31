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
    apiKey: 'AIzaSyCveb98haBaVsH6EPYtgimeyZ0JlglZqK8',
    appId: '1:618941438947:web:fd9a5d2726ae94a1579ed6',
    messagingSenderId: '618941438947',
    projectId: 'flutter-my-app-18a52',
    authDomain: 'flutter-my-app-18a52.firebaseapp.com',
    storageBucket: 'flutter-my-app-18a52.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsML103uweDdpM5qtUIl9F9YuW1wURGE8',
    appId: '1:618941438947:android:825d0829bc23f121579ed6',
    messagingSenderId: '618941438947',
    projectId: 'flutter-my-app-18a52',
    storageBucket: 'flutter-my-app-18a52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBohjhTPgGVgW20MCGQh-po6kfdgmepkLs',
    appId: '1:618941438947:ios:d4a0f6ed2ef303c9579ed6',
    messagingSenderId: '618941438947',
    projectId: 'flutter-my-app-18a52',
    storageBucket: 'flutter-my-app-18a52.appspot.com',
    iosClientId: '618941438947-q7mjhuar7d8cb6dr79rshilm5ttke6l0.apps.googleusercontent.com',
    iosBundleId: 'com.hee462.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBohjhTPgGVgW20MCGQh-po6kfdgmepkLs',
    appId: '1:618941438947:ios:fd21c4de942e0ae1579ed6',
    messagingSenderId: '618941438947',
    projectId: 'flutter-my-app-18a52',
    storageBucket: 'flutter-my-app-18a52.appspot.com',
    iosClientId: '618941438947-eoq2kvsh4kb903ge7nu218uaqd4freud.apps.googleusercontent.com',
    iosBundleId: 'com.hee462.firebase.RunnerTests',
  );
}
