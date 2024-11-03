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
    apiKey: 'AIzaSyCyYAsUJ8uO0C2ltt1Vhp2L5WH_jRcvXxQ',
    appId: '1:648384867205:web:6ea20068d8d7be69d0f2ec',
    messagingSenderId: '648384867205',
    projectId: 'hpc-food',
    authDomain: 'hpc-food.firebaseapp.com',
    storageBucket: 'hpc-food.firebasestorage.app',
    measurementId: 'G-1G7ZF6W0EG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzqj3w23yccKP8vQMrx5lNF7noNrd7TPM',
    appId: '1:648384867205:android:7b2893f5646b674bd0f2ec',
    messagingSenderId: '648384867205',
    projectId: 'hpc-food',
    storageBucket: 'hpc-food.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUImV01hSkDZtCMLgVqAapqE7un_fLqkM',
    appId: '1:648384867205:ios:1f3181b819d46da9d0f2ec',
    messagingSenderId: '648384867205',
    projectId: 'hpc-food',
    storageBucket: 'hpc-food.firebasestorage.app',
    iosClientId: '648384867205-dk7cpdio72tjtngjceu3aae0n0i178gk.apps.googleusercontent.com',
    iosBundleId: 'com.example.hpcFood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUImV01hSkDZtCMLgVqAapqE7un_fLqkM',
    appId: '1:648384867205:ios:1f3181b819d46da9d0f2ec',
    messagingSenderId: '648384867205',
    projectId: 'hpc-food',
    storageBucket: 'hpc-food.firebasestorage.app',
    iosClientId: '648384867205-dk7cpdio72tjtngjceu3aae0n0i178gk.apps.googleusercontent.com',
    iosBundleId: 'com.example.hpcFood',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCyYAsUJ8uO0C2ltt1Vhp2L5WH_jRcvXxQ',
    appId: '1:648384867205:web:7984b9ab42883eb7d0f2ec',
    messagingSenderId: '648384867205',
    projectId: 'hpc-food',
    authDomain: 'hpc-food.firebaseapp.com',
    storageBucket: 'hpc-food.firebasestorage.app',
    measurementId: 'G-KZJVPX378K',
  );
}