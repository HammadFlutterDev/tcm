import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../utils/app_logger.dart';


class FirebaseService {
  FirebaseService._();

  static final FirebaseService _singleton = FirebaseService._();

  static FirebaseService get firebaseInstance => _singleton;

  static late final String? fcmToken;

  //helper method to get token
  String? getFCMToken() => fcmToken;
  //CREATE AN INSTANCE OF FIREBASE MESSAGING
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static firebaseTokenInitial() async {
    fcmToken = await firebaseMessaging.getToken();
    appLog("Fcm Token - $fcmToken");
  }
}
