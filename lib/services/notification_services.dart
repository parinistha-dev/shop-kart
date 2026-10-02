import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// ─────────────────────────────────────────────────────────────────────────────
/// Top-level background handler – MUST be a top-level function (not a method).
/// Firebase calls this when the app is terminated or in the background.
/// ─────────────────────────────────────────────────────────────────────────────
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase is already initialised in main() before this is registered,
  // so no need to call Firebase.initializeApp() here again.
  printMessage('🔔 [BG] Notification received: ${message.messageId}');
}

/// ─────────────────────────────────────────────────────────────────────────────
/// FirebaseNotificationService
/// Handles every state: foreground, background-tap, and terminated-tap.
/// ─────────────────────────────────────────────────────────────────────────────
class FirebaseNotificationService {
  FirebaseNotificationService._();

  static final instance = FirebaseNotificationService._();

  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();

  /// Android notification channel used for high-priority alerts.
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'optiko_vendor_high_importance_channel',
    'Optiko Vendor High Tear Channel',
    description:
        'This channel is used for important Optiko Vendor notifications.',
    importance: Importance.max,
    playSound: true,
  );

  Future<void> initialize() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
    printMessage('🔔 Notification permission: ${settings.authorizationStatus}');

    const androidInit = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: androidInit,
        iOS: iosInit,
      ),
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );

    // 3️⃣ Create the high-importance Android channel
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);

    // 4️⃣ iOS foreground presentation options
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // 5️⃣ Foreground messages → show local notification manually (Android)
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // 6️⃣ Background → app opened via notification tap
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // 7️⃣ Terminated → app launched via notification tap
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        _routeFromMessage(initialMessage);
      });
    }

    printMessage('✅ FirebaseNotificationService initialised');
  }

  // ─── Foreground ─────────────────────────────────────────────────────────────

  void _handleForegroundMessage(RemoteMessage message) {
    printMessage('🔔 [FG] ${message.notification?.title}');

    final notification = message.notification;

    if (notification != null && !kIsWeb) {
      _localNotifications.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: jsonEncode(message.data),
      );
    }
  }

  // ─── Background tap ──────────────────────────────────────────────────────────

  void _handleMessageOpenedApp(RemoteMessage message) {
    printMessage('🔔 [BG-tap] ${message.notification?.title}');
    _routeFromMessage(message);
  }

  // ─── Local notification tap ───────────────────────────────────────────────────

  void _onLocalNotificationTap(NotificationResponse response) {
    if (response.payload == null) return;
    try {
      final data = jsonDecode(response.payload!) as Map<String, dynamic>;
      _routeFromData(data);
    } catch (_) {}
  }

  // ─── Routing logic ────────────────────────────────────────────────────────────

  void _routeFromMessage(RemoteMessage message) {
    _routeFromData(message.data);
  }

  /// Adjust the routing map below to match your backend's `type` payloads.
  void _routeFromData(Map<String, dynamic> data) {
    final type = (data['type'] ?? '').toString().toLowerCase();
    printMessage('🔔 Routing from notification type: $type');

    /*if (type.contains('order')) {
      Get.toNamed(AppRoutes.ordersList);
    } else if (type.contains('wallet') || type.contains('payment')) {
      Get.toNamed(AppRoutes.wallet);
    } else if (type.contains('delivery')) {
      Get.toNamed(AppRoutes.activeDeliveries);
    } else {
      Get.toNamed(AppRoutes.notification);
    }*/
  }
}

void printMessage(String message) {
  log(message);
}
