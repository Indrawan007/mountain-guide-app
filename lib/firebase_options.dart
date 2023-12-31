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
    apiKey: 'AIzaSyCDMyybGFOphFJAdswz70pIIISCS10Y8og',
    appId: '1:669337995472:web:44ca5966a0e3413607b6d5',
    messagingSenderId: '669337995472',
    projectId: 'mountain-guide-app-a2189',
    authDomain: 'mountain-guide-app-a2189.firebaseapp.com',
    storageBucket: 'mountain-guide-app-a2189.appspot.com',
    measurementId: 'G-4CWRGRMZ0R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3fCTPWRlwIw5-Qrv67c-4wwpl62sb558',
    appId: '1:669337995472:android:17b8ef67c4040fa607b6d5',
    messagingSenderId: '669337995472',
    projectId: 'mountain-guide-app-a2189',
    storageBucket: 'mountain-guide-app-a2189.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUVdviaD5XBJf4-b_JF-i66aDZWSk6COc',
    appId: '1:669337995472:ios:468e37fa453030ad07b6d5',
    messagingSenderId: '669337995472',
    projectId: 'mountain-guide-app-a2189',
    storageBucket: 'mountain-guide-app-a2189.appspot.com',
    iosClientId: '669337995472-cvpcnl08fiv2c8o70ku1mija8nkrdttt.apps.googleusercontent.com',
    iosBundleId: 'com.example.mountainGuideApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUVdviaD5XBJf4-b_JF-i66aDZWSk6COc',
    appId: '1:669337995472:ios:9a76c91156ad719907b6d5',
    messagingSenderId: '669337995472',
    projectId: 'mountain-guide-app-a2189',
    storageBucket: 'mountain-guide-app-a2189.appspot.com',
    iosClientId: '669337995472-ttlcjpnhllto9fs1mu6kfhvau5j09fv0.apps.googleusercontent.com',
    iosBundleId: 'com.example.mountainGuideApp.RunnerTests',
  );
}
