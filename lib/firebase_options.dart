// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCbOU18CaGxX6MfBFn5Im8G6jt7-1Q_l00',
    appId: '1:966708253815:web:5c691e73852f6fefa8e272',
    messagingSenderId: '966708253815',
    projectId: 'gerenciador-matricula',
    authDomain: 'gerenciador-matricula.firebaseapp.com',
    storageBucket: 'gerenciador-matricula.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfIR3l5qk-wFyC12YC0JcmG9nsuvpYcZQ',
    appId: '1:966708253815:android:aeb10f683ecfe4d3a8e272',
    messagingSenderId: '966708253815',
    projectId: 'gerenciador-matricula',
    storageBucket: 'gerenciador-matricula.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbOU18CaGxX6MfBFn5Im8G6jt7-1Q_l00',
    appId: '1:966708253815:web:9a23e0bd9d7bb642a8e272',
    messagingSenderId: '966708253815',
    projectId: 'gerenciador-matricula',
    authDomain: 'gerenciador-matricula.firebaseapp.com',
    storageBucket: 'gerenciador-matricula.firebasestorage.app',
  );
}
