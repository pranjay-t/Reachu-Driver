import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:reachu_driver/app/router/app_router.dart';
import 'package:reachu_driver/firebase_options.dart';
import 'package:reachu_driver/core/firebase/firebase_crashlytics_service.dart';
import 'package:reachu_driver/core/socket/overlay_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service to handle Firebase Cloud Messaging (FCM) and Local Notifications.
class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Android notification channel details.
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
    playSound: true,
  );

  /// Notification channel specifically for ride requests with a custom sound.
  static const AndroidNotificationChannel _rideChannel =
      AndroidNotificationChannel(
        'ride_request_channel_v10', // id — MUST match Kotlin SocketForegroundService.RIDE_CHANNEL_ID
        'Ride Requests', // title
        description: 'Notifications for incoming ride requests.', // description
        importance: Importance.max,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('new_ride_sound'),
        enableLights: true,
        ledColor: Color(0xFFFF0000),
        enableVibration: true,
      );

  /// Initializes messaging permissions, local notifications, and event listeners.
  static Future<void> initialize() async {
    // 1. Request Notification permissions (Disabled on startup per requirement)
    // NotificationSettings settings = await _messaging.requestPermission(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    //   provisional: false,
    // );
    //
    // if (kDebugMode) {
    //   print('User granted notification permission: ${settings.authorizationStatus}');
    // }

    // 2. Setup Android Local Notifications Channels
    final androidPlugin = _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(_channel);
    await androidPlugin?.createNotificationChannel(_rideChannel);

    // 3. Initialize Local Notifications settings
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _localNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _onLocalNotificationTapped,
    );

    // 4. Set up FCM message listeners

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Got a message in the foreground: ${message.messageId}');
      }
      _showForegroundNotification(message);
    });

    // Background message tap listener (when app is in background but not terminated)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
      }
      _handleNotificationPayload(message.data);
    });

    // Terminated state handler
    final RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      if (kDebugMode) {
        print('App launched from terminated state via notification');
      }
      _handleNotificationPayload(initialMessage.data);
    }

    // Background message handler registration
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);
  }

  /// Public static helper to display a local notification with custom ride request sound.
  static void showRideRequestNotification({
    required String orderId,
    required String title,
    required String body,
  }) {
    _localNotificationsPlugin.show(
      id: orderId.hashCode,
      title: title,
      body: body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'ride_request_channel_v10',
          'Ride Requests',
          channelDescription: 'Notifications for incoming ride requests.',
          icon: '@mipmap/ic_launcher',
          importance: Importance.max,
          priority: Priority.max,
          visibility: NotificationVisibility.public,
          enableLights: true,
          ledColor: Color(0xFFFF0000),
          ledOnMs: 500,
          ledOffMs: 500,
          fullScreenIntent: true,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('new_ride_sound'),
        ),
      ),
      payload: '{"orderId":"$orderId", "route":"/home"}',
    );
  }

  /// Fetches the current FCM Token for the device.
  static Future<String?> getDeviceToken() async {
    try {
      final token = await _messaging.getToken();
      if (kDebugMode) {
        print('FCM Token: $token');
      }
      return token;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting FCM token: $e');
      }
      return null;
    }
  }

  /// Sets up a listener to monitor FCM token refreshes.
  static Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  /// Shows a heads-up notification banner when the app is in the foreground.
  static void _showForegroundNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      final title = notification.title ?? '';
      final body = notification.body ?? '';

      // Determine if this is a ride-related notification
      final isRideNotification =
          message.data['type'] == 'ride_request' ||
          message.data['click_action'] == '/arriving_client' ||
          title.toLowerCase().contains('ride') ||
          title.toLowerCase().contains('request') ||
          body.toLowerCase().contains('ride');

      _localNotificationsPlugin.show(
        id: notification.hashCode,
        title: title,
        body: body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            isRideNotification ? _rideChannel.id : _channel.id,
            isRideNotification ? _rideChannel.name : _channel.name,
            channelDescription: isRideNotification
                ? _rideChannel.description
                : _channel.description,
            icon: android.smallIcon ?? '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.max,
            visibility: NotificationVisibility.public,
            enableLights: true,
            ledColor: const Color(0xFFFF0000),
            ledOnMs: 500,
            ledOffMs: 500,
            fullScreenIntent: isRideNotification,
            playSound: true,
            sound: isRideNotification
                ? const RawResourceAndroidNotificationSound('new_ride_sound')
                : null,
          ),
        ),
        payload: jsonEncode(message.data),
      );
    }
  }

  /// Callback when a local notification banner is tapped in the foreground.
  static void _onLocalNotificationTapped(NotificationResponse response) {
    final payload = response.payload;
    if (payload != null && payload.isNotEmpty) {
      try {
        final Map<String, dynamic> data = jsonDecode(payload);
        _handleNotificationPayload(data);
      } catch (e) {
        if (kDebugMode) {
          print('Error parsing local notification payload: $e');
        }
      }
    }
  }

  /// Routes the user to the correct screen based on the notification data payload.
  static void _handleNotificationPayload(Map<String, dynamic> data) {
    // Extract destination route or action parameter from FCM payload
    // Example payload structure: {"route": "/history"} or {"click_action": "history"}
    final route = data['route'] ?? data['click_action'];
    if (route != null && route.toString().isNotEmpty) {
      final String targetRoute = route.toString();

      // Execute routing via GoRouter using the root navigator context
      final context = rootNavigatorKey.currentContext;
      if (context != null) {
        try {
          context.go(targetRoute);
        } catch (e) {
          if (kDebugMode) {
            print('Failed to route via GoRouter: $e');
          }
        }
      } else {
        if (kDebugMode) {
          print(
            'Navigator context is null, cannot perform notification routing',
          );
        }
      }
    }
  }

  /// Displays local notifications in background (with driver_is_online check).
  static Future<void> showNotificationInBackground(
    RemoteMessage message,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isOnline = prefs.getBool("driver_is_online") ?? false;
      if (!isOnline) {
        if (kDebugMode) {
          print(
            'Suppressing background FCM notification because driver is offline.',
          );
        }
        return;
      }

      if (isOnline) {
        // Automatically attempt to show the floating bubble overlay if permission is granted
        try {
          final hasP = await OverlayService.instance.hasPermission();
          if (hasP) {
            await OverlayService.instance.showOverlay();
          }
        } catch (e) {
          if (kDebugMode) {
            print('Error showing overlay from background notification: $e');
          }
        }
      }

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        final title = notification.title ?? '';
        final body = notification.body ?? '';

        final isRideNotification =
            message.data['type'] == 'ride_request' ||
            message.data['click_action'] == '/arriving_client' ||
            title.toLowerCase().contains('ride') ||
            title.toLowerCase().contains('request') ||
            body.toLowerCase().contains('ride');

        const AndroidInitializationSettings initializationSettingsAndroid =
            AndroidInitializationSettings('@mipmap/ic_launcher');
        const InitializationSettings initializationSettings =
            InitializationSettings(android: initializationSettingsAndroid);
        await _localNotificationsPlugin.initialize(
          settings: initializationSettings,
        );

        await _localNotificationsPlugin.show(
          id: notification.hashCode,
          title: title,
          body: body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              isRideNotification ? _rideChannel.id : _channel.id,
              isRideNotification ? _rideChannel.name : _channel.name,
              channelDescription: isRideNotification
                  ? _rideChannel.description
                  : _channel.description,
              icon: android.smallIcon ?? '@mipmap/ic_launcher',
              importance: Importance.max,
              priority: Priority.max,
              visibility: NotificationVisibility.public,
              enableLights: true,
              ledColor: const Color(0xFFFF0000),
              ledOnMs: 500,
              ledOffMs: 500,
              fullScreenIntent: isRideNotification,
              playSound: true,
              sound: isRideNotification
                  ? const RawResourceAndroidNotificationSound('new_ride_sound')
                  : null,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in showNotificationInBackground: $e');
      }
    }
  }
}

/// Top-level background message handler for FCM.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundMessageHandler(RemoteMessage message) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlyticsService.initialize();
  } catch (e) {
    if (kDebugMode) {
      print('Error initializing Firebase in background isolate: $e');
    }
  }
  await NotificationService.showNotificationInBackground(message);
}
