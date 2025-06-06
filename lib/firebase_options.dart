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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBgb-98pv54gmhsOyPxOC3XcNs_Al6bJGE',
    appId: '1:455552212986:web:0eb6435caf3a005717ce43',
    messagingSenderId: '455552212986',
    projectId: 'mobile-programming-flutter',
    authDomain: 'mobile-programming-flutter.firebaseapp.com',
    storageBucket: 'mobile-programming-flutter.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAERPAL7HzOUDay1nAwWY2xPNFkKEGMH2M',
    appId: '1:455552212986:android:a5047c28d97a559e17ce43',
    messagingSenderId: '455552212986',
    projectId: 'mobile-programming-flutter',
    storageBucket: 'mobile-programming-flutter.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv4bLh9Lsa0rgRV2RSH05ujcjOIrK4brI',
    appId: '1:455552212986:ios:64d431171d2ae0a217ce43',
    messagingSenderId: '455552212986',
    projectId: 'mobile-programming-flutter',
    storageBucket: 'mobile-programming-flutter.firebasestorage.app',
    iosBundleId: 'com.example.postMidterm',
  );
}
