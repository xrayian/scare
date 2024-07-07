import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyCTP4XL4hq01DeEVQqudEXDpfZuVr-CVIo',
    appId: '1:1052246670790:web:9a64e793732925c42546c7',
    messagingSenderId: '1052246670790',
    projectId: 'scare-65e1b',
    authDomain: 'scare-65e1b.firebaseapp.com',
    storageBucket: 'scare-65e1b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4qOdwSDqc481-nBNf6ZEvjxZDpDmjVv4',
    appId: '1:1052246670790:android:f6964e1857ccaf7c2546c7',
    messagingSenderId: '1052246670790',
    projectId: 'scare-65e1b',
    storageBucket: 'scare-65e1b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwHrmdJ2bMu4C4cP-ZnDfFicDgYd9215I',
    appId: '1:1052246670790:ios:654a7e35d9b3e2f32546c7',
    messagingSenderId: '1052246670790',
    projectId: 'scare-65e1b',
    storageBucket: 'scare-65e1b.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwHrmdJ2bMu4C4cP-ZnDfFicDgYd9215I',
    appId: '1:1052246670790:ios:654a7e35d9b3e2f32546c7',
    messagingSenderId: '1052246670790',
    projectId: 'scare-65e1b',
    storageBucket: 'scare-65e1b.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTP4XL4hq01DeEVQqudEXDpfZuVr-CVIo',
    appId: '1:1052246670790:web:db1341e59aac80922546c7',
    messagingSenderId: '1052246670790',
    projectId: 'scare-65e1b',
    authDomain: 'scare-65e1b.firebaseapp.com',
    storageBucket: 'scare-65e1b.appspot.com',
  );
}

