import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../firebase_options.dart';
import '../router/app_routes.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
InitializationSettings initializationSettings = const InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  iOS: DarwinInitializationSettings(),
);

Future<void> notificationInitialize() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kDebugMode) {
      final String? fcmToken = await FirebaseMessaging.instance.getToken();
      debugPrint('FCM TOKEN $fcmToken');
    }
    await setupFlutterNotifications();
    if (Platform.isAndroid) {
      await foregroundNotification();
    }
    await backgroundNotification();
    await terminateNotification();
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  } on Exception catch (e, s) {
    debugPrint('FCM TOKEN ERROR $e $s');
  }
}

Future<void> setupFlutterNotifications() async {
  print('--->> setupFlutterNotifications');
  if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission(announcement: true);
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

Future<void> showFlutterNotification(RemoteMessage message) async {
  print('--->> showFlutterNotification');
  final RemoteNotification? notification = message.notification;
  if (!kIsWeb) {
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification?.title ?? '',
      notification?.body ?? '',
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          styleInformation: BigTextStyleInformation(
            notification?.body ?? '',
            contentTitle: notification?.title ?? '',
          ),
          icon: '@mipmap/ic_launcher',
          priority: Priority.high,
          importance: Importance.high,
          visibility: NotificationVisibility.public,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: message.data['response'],
    );
  }
}

Future<void> foregroundNotification() async {
  FirebaseMessaging.onMessage.listen(showFlutterNotification);

  ///When tapped
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) async {
      debugPrint('--->> foreground RESPONSE: ${response.payload}');
      if (response.payload != null && response.payload!.isNotEmpty) {
        print(response.payload);
        await router.pushNamed(
          Routes.orderByNotification,
          extra: response.payload,
        );
      } else {
        await router.pushNamed(Routes.notification);
      }
    },
  );
}

Future<void> backgroundNotification() async {
  FirebaseMessaging.onMessageOpenedApp.listen(
    (message) async {
      debugPrint('--->> A new onMessageOpenedApp event was published!');
      debugPrint('--->> ${message.data['response']}');
      if (message.data['response'] is String &&
          // ignore: avoid_dynamic_calls
          message.data['response'].isNotEmpty) {
        await router.pushNamed(
          Routes.orderByNotification,
          extra: message.data['response'],
        );
      } else {
        await router.pushNamed(Routes.notification);
      }
    },
  );
}

Future<void> terminateNotification() async {
  debugPrint('--->> terminateNotification called');
  final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (remoteMessage == null) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } else {
    await showFlutterNotification(remoteMessage);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('--->> Handling a background message ${message.data}');
  await Firebase.initializeApp();
  // await setupFlutterNotifications();
  await showFlutterNotification(message);
}
