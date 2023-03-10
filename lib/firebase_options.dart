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
    apiKey: 'AIzaSyACRVDIcL2FEj3ZNHE68spCOOnTjazZm5o',
    appId: '1:262172804835:web:5b832668d784b77210a7d6',
    messagingSenderId: '262172804835',
    projectId: 'assign-c1e87',
    authDomain: 'assign-c1e87.firebaseapp.com',
    storageBucket: 'assign-c1e87.appspot.com',
    measurementId: 'G-GENF6TQWYG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwOJ6P8QOEq1dRvR5CGEE7WTj4_5eEFUM',
    appId: '1:262172804835:android:77c1fafc19ef5a4d10a7d6',
    messagingSenderId: '262172804835',
    projectId: 'assign-c1e87',
    storageBucket: 'assign-c1e87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAreycOxrJuQgaVZl0EySiDkJA5eq2dv0Q',
    appId: '1:262172804835:ios:23fda531364945a410a7d6',
    messagingSenderId: '262172804835',
    projectId: 'assign-c1e87',
    storageBucket: 'assign-c1e87.appspot.com',
    iosClientId: '262172804835-smk1gnfagrgedvutpfdvjv1ii691nlo3.apps.googleusercontent.com',
    iosBundleId: 'com.example.cashrich',
  );
}
