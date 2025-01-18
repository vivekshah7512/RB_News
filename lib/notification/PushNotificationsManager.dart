import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:r_b_news/notification/preference_notification.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message != null) {
    await Firebase.initializeApp();
    print("Notification Custom Data background : " + message.data.toString());
    print(
        'Handling a background message ${message.notification!.body.toString()}');
    preference_notification()
        .setPref('is_notification_data', json.encode(message.data));
    //Preference.saveString('is_notification_data', json.encode(message.data));
  }
}

class PushNotificationsManager {
  static BuildContext? _context;

  PushNotificationsManager._(_context);

  //factory PushNotificationsManager() => _instance;
  factory PushNotificationsManager(BuildContext context) {
    _context = context;
    return _instance;
  }

  static final PushNotificationsManager _instance =
      PushNotificationsManager._(_context);

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          Redirect(response.payload!); // Use the new payload format
        }
      },
    );

    if (!_initialized) {
      await Firebase.initializeApp();

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        print("Notification Custom Data : " + message.data.toString());
        print("Notification Custom Data : " +
            message.notification!.title.toString());
        print("Notification Custom Data : " +
            message.notification!.body.toString());
        _showNotification(1234, message.notification!.title.toString(),
            message.notification!.body.toString(), json.encode(message.data));
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("Notification Custom Data onMessageOpenedApp: " +
            message.data.toString());
        print("onMessageOpenedApp: " + message.notification!.title.toString());
        Redirect(json.encode(message.data));
      });

      if (Platform.isIOS) {
      } else {
        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler);
      }
      _firebaseMessaging.requestPermission(
        sound: true,
        alert: true,
        badge: false,
      );
      _firebaseMessaging.getToken().then((token) async {
        print('Registration Token Id: $token');
        //PreferenceManager().setPref('devie_token', token.toString());
      });
      _initialized = true;
    }
  }

  void Redirect(String payload) async {
    Map<String, dynamic> mapData = new HashMap();
    mapData = json.decode(payload);
    print(mapData);
    //Preference.saveString('is_notification_data', json.encode(mapData));
    preference_notification()
        .setPref('is_notification_data', json.encode(mapData));
  }

  Future<void> _showNotification(
    int notificationId,
    String notificationTitle,
    String notificationContent,
    String payload, {
    String channelId = 'rb-news',
    String channelTitle = 'RB News',
    String channelDescription = 'Default Android Channel for notifications',
    Priority notificationPriority = Priority.high,
    Importance notificationImportance = Importance.max,
  }) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      channelId,
      channelTitle,
      channelDescription: channelDescription,
      playSound: true,
      importance: notificationImportance,
      priority: notificationPriority,
    );
    var iOSPlatformChannelSpecifics = new DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      notificationTitle,
      notificationContent,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
