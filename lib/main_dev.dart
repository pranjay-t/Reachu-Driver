import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachu_driver/core/firebase/app_check_service.dart';
import 'package:reachu_driver/core/firebase/firebase_crashlytics_service.dart';
import 'package:reachu_driver/core/firebase/notification_service.dart';
import 'package:reachu_driver/core/network/company_bucket_url.dart';
import 'package:reachu_driver/features/booking/ui/widgets/overlay_bubble.dart';

import 'firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseCrashlyticsService.initialize();
  await AppCheckService.initialize();
  await NotificationService.initialize();
  await dotenv.load(fileName: ".env");
  await CompanyBucketUrl.init();

  FlavorConfig(
    name: "DEV",
    color: Colors.red,
    location: BannerLocation.topStart,
    variables: {
      "baseUrl":
          dotenv.env['BASE_URL'] ?? "https://dev.api.reachu.co.in/api/v1",
    },
  );

  runApp(const ProviderScope(child: MyApp()));
}

@pragma('vm:entry-point')
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        canvasColor: Colors.transparent,
      ),
      home: const Scaffold(
        backgroundColor: Colors.transparent,
        body: OverlayBubble(),
      ),
    ),
  );
}
