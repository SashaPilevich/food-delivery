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
    apiKey: 'AIzaSyDDP3k6luFaYlwph5K2ZTow3Z3lUba_Op0',
    appId: '1:1054535070056:web:aab4cdc99889c1ee5366dd',
    messagingSenderId: '1054535070056',
    projectId: 'food-delivery-2af3e',
    authDomain: 'food-delivery-2af3e.firebaseapp.com',
    storageBucket: 'food-delivery-2af3e.appspot.com',
    measurementId: 'G-70G238M106',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrBK_fduFGymzQt5bvD9aJXX4V4hzypf0',
    appId: '1:1054535070056:android:bf78c71b537a0eab5366dd',
    messagingSenderId: '1054535070056',
    projectId: 'food-delivery-2af3e',
    storageBucket: 'food-delivery-2af3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdWqrXVUzuJWRMr8MUoGzYFgGQimqnmrA',
    appId: '1:1054535070056:ios:a4db6ba0e91ceec55366dd',
    messagingSenderId: '1054535070056',
    projectId: 'food-delivery-2af3e',
    storageBucket: 'food-delivery-2af3e.appspot.com',
    iosClientId:
        '1054535070056-8bnof31qn6687tf4mqkii09q9no4b4sg.apps.googleusercontent.com',
    iosBundleId: 'com.food.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdWqrXVUzuJWRMr8MUoGzYFgGQimqnmrA',
    appId: '1:1054535070056:ios:a4db6ba0e91ceec55366dd',
    messagingSenderId: '1054535070056',
    projectId: 'food-delivery-2af3e',
    storageBucket: 'food-delivery-2af3e.appspot.com',
    iosClientId:
        '1054535070056-8bnof31qn6687tf4mqkii09q9no4b4sg.apps.googleusercontent.com',
    iosBundleId: 'com.food.app',
  );
}
