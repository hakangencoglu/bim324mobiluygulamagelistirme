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
    apiKey: 'AIzaSyAUx2mlF3UQoQXx-rWTjOuoFOjpCjWszgQ',
    appId: '1:712231955325:web:3f05ad1561c50e01e97a14',
    messagingSenderId: '712231955325',
    projectId: 'mobiluygulamagelistirme-d5421',
    authDomain: 'mobiluygulamagelistirme-d5421.firebaseapp.com',
    storageBucket: 'mobiluygulamagelistirme-d5421.firebasestorage.app',
    measurementId: 'G-VMZ7NKY5V3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpH5DFJsxeOcs8-s1CbGfxXft1VG_6J-A',
    appId: '1:712231955325:android:0093fad0481b2797e97a14',
    messagingSenderId: '712231955325',
    projectId: 'mobiluygulamagelistirme-d5421',
    storageBucket: 'mobiluygulamagelistirme-d5421.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-8I6W5zoiZFu_-JLGYc6p-p6SFnBfAFc',
    appId: '1:712231955325:ios:0b67966403cd3efce97a14',
    messagingSenderId: '712231955325',
    projectId: 'mobiluygulamagelistirme-d5421',
    storageBucket: 'mobiluygulamagelistirme-d5421.firebasestorage.app',
    iosBundleId: 'com.example.flutterfirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-8I6W5zoiZFu_-JLGYc6p-p6SFnBfAFc',
    appId: '1:712231955325:ios:0b67966403cd3efce97a14',
    messagingSenderId: '712231955325',
    projectId: 'mobiluygulamagelistirme-d5421',
    storageBucket: 'mobiluygulamagelistirme-d5421.firebasestorage.app',
    iosBundleId: 'com.example.flutterfirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAUx2mlF3UQoQXx-rWTjOuoFOjpCjWszgQ',
    appId: '1:712231955325:web:d52d54e5fe773033e97a14',
    messagingSenderId: '712231955325',
    projectId: 'mobiluygulamagelistirme-d5421',
    authDomain: 'mobiluygulamagelistirme-d5421.firebaseapp.com',
    storageBucket: 'mobiluygulamagelistirme-d5421.firebasestorage.app',
    measurementId: 'G-5695VRQTVR',
  );
}
