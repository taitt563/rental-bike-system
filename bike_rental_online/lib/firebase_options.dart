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
    apiKey: 'AIzaSyAGBaUt42XPiLBUbGX-brTtisOk780Mf3s',
    appId: '1:206322256402:web:b41375d52de8936d1366cb',
    messagingSenderId: '206322256402',
    projectId: 'bike-rental-project-de5fd',
    authDomain: 'bike-rental-project-de5fd.firebaseapp.com',
    storageBucket: 'bike-rental-project-de5fd.appspot.com',
    measurementId: 'G-ZVSZ669WZM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCXcCARMi6oMhtpvzgkbQilwSzKu3GYN4',
    appId: '1:206322256402:android:741a8cc62f53e1341366cb',
    messagingSenderId: '206322256402',
    projectId: 'bike-rental-project-de5fd',
    storageBucket: 'bike-rental-project-de5fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFF27DPVg1qAk_9TWTwDvrgu2poGPyONw',
    appId: '1:206322256402:ios:d3e353b213a3af231366cb',
    messagingSenderId: '206322256402',
    projectId: 'bike-rental-project-de5fd',
    storageBucket: 'bike-rental-project-de5fd.appspot.com',
    androidClientId: '206322256402-0sjb6ro071j0ud1fgm2pgcb21q7m975p.apps.googleusercontent.com',
    iosClientId: '206322256402-3obe8jb31nvqr0s4or5fih3rgg5lms72.apps.googleusercontent.com',
    iosBundleId: 'com.example.bikeRentalOnline',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFF27DPVg1qAk_9TWTwDvrgu2poGPyONw',
    appId: '1:206322256402:ios:7847508fddee9aa31366cb',
    messagingSenderId: '206322256402',
    projectId: 'bike-rental-project-de5fd',
    storageBucket: 'bike-rental-project-de5fd.appspot.com',
    androidClientId: '206322256402-0sjb6ro071j0ud1fgm2pgcb21q7m975p.apps.googleusercontent.com',
    iosClientId: '206322256402-ikol1cmvgobuvcfmh5e0jli61cbh3pi6.apps.googleusercontent.com',
    iosBundleId: 'com.example.bikeRentalOnline.RunnerTests',
  );
}
