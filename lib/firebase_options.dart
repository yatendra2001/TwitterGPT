// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.get('API_KEY_WEB'),
    appId: dotenv.get('APP_ID_WEB'),
    messagingSenderId: dotenv.get('MESSAGING_SENDER_ID_WEB'),
    projectId: dotenv.get('PROJECT_ID_WEB'),
    authDomain: dotenv.get('AUTH_DOMAIN_WEB'),
    storageBucket: dotenv.get('STORAGE_BUCKET_WEB'),
    measurementId: dotenv.get('MEASUREMENT_ID_WEB'),
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.get('API_KEY_ANDROID'),
    appId: dotenv.get('APP_ID_ANDROID'),
    messagingSenderId: dotenv.get('MESSAGING_SENDER_ID_ANDROID'),
    projectId: dotenv.get('PROJECT_ID_ANDROID'),
    storageBucket: dotenv.get('STORAGE_BUCKET_ANDROID'),
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.get('API_KEY_IOS'),
    appId: dotenv.get('APP_ID_IOS'),
    messagingSenderId: dotenv.get('MESSAGING_SENDER_ID_IOS'),
    projectId: dotenv.get('PROJECT_ID_IOS'),
    storageBucket: dotenv.get('STORAGE_BUCKET_IOS'),
    iosClientId: dotenv.get('IOS_CLIENT_ID_IOS'),
    iosBundleId: dotenv.get('IOS_BUNDLE_ID_IOS'),
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.get('API_KEY_MACOS'),
    appId: dotenv.get('APP_ID_MACOS'),
    messagingSenderId: dotenv.get('MESSAGING_SENDER_ID_MACOS'),
    projectId: dotenv.get('PROJECT_ID_MACOS'),
    storageBucket: dotenv.get('STORAGE_BUCKET_MACOS'),
    iosClientId: dotenv.get('IOS_CLIENT_ID_MACOS'),
    iosBundleId: dotenv.get('IOS_BUNDLE_ID_MACOS'),
  );
}
