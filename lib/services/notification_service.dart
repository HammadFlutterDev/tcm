import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../providers/notification_alert_provider.dart';
class NotificationService{
   NotificationService._();
  static final  NotificationService _singleton =  NotificationService._();
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static  NotificationService get notificationInstance => _singleton;
 static  Future<void> initLocalNotification(
       RemoteMessage message) async {
    AndroidInitializationSettings androidInitialization =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    DarwinInitializationSettings darwinInitialization =
        const DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitialization,
      iOS: darwinInitialization,
    );
   
    showNotitfication(message);

    
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {},
    );
  }

 static Future<void> showNotitfication(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      "High Importance Notification",
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channel.id, channel.name,
            importance: Importance.high,
            channelDescription: "My channel description",
            priority: Priority.high,
            ticker: "ticker");
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: darwinNotificationDetails, android: androidNotificationDetails);
    Future.delayed(
        Duration.zero,
        () => _flutterLocalNotificationsPlugin.show(
            0,
            message.notification?.title.toString(),
            message.notification?.body.toString(),
            notificationDetails));
  }
    //FUNCTION TO INITIALIZE NOTIFICATION
  static Future<void> initNotifications(WidgetRef ref) async {

    
    
    //reuest permission from user (will prompt user)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((noti) {
      handleBackgroundMessage(noti);
      ref.read(notificationAlertProvider.notifier).toggleNotification(true); 
    });

   
  }
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    NotificationService.initLocalNotification(message);
    }
  
   
}