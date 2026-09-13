import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';

/// Service to handle Firebase App Check initialization and token retrieval.
class AppCheckService {
  /// Activates App Check with Play Integrity for production and Debug provider for development.
  static Future<void> initialize() async {
    try {
      await FirebaseAppCheck.instance.activate(
        // Use Play Integrity in profile/release, Debug in debug runs
        providerAndroid: kDebugMode 
            ? const AndroidDebugProvider() 
            : const AndroidPlayIntegrityProvider(),
        providerApple: const AppleDebugProvider(),
      );
    } catch (e) {
      // Catch initialization errors gracefully
      if (kDebugMode) {
        print('Firebase App Check initialization failed: $e');
      }
    }
  }

  /// Retrieves the current App Check token, refreshing if necessary.
  static Future<String?> getToken({bool forceRefresh = false}) async {
    try {
      return await FirebaseAppCheck.instance.getToken(forceRefresh);
    } catch (e) {
      if (kDebugMode) {
        print('Error getting App Check token: $e');
      }
      return null;
    }
  }
  
  /// Stream to listen to App Check token changes.
  static Stream<String?> get tokenChanges => FirebaseAppCheck.instance.onTokenChange;
}
