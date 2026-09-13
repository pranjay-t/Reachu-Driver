import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Service to handle Firebase Crashlytics initialization and crash/error logging.
class FirebaseCrashlyticsService {
  /// Initializes Crashlytics and sets up global error catchers.
  static Future<void> initialize() async {
    // Pass all uncaught errors from the framework to Crashlytics
    FlutterError.onError = (FlutterErrorDetails details) {
      if (_isNonFatalFrameworkError(details)) {
        // Record non-fatal image/codec 404 & missing plugin errors without crashing app metrics
        FirebaseCrashlytics.instance.recordFlutterError(details);
      } else {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      }
    };

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      if (_isNonFatalAsyncError(error)) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: false);
      } else {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
      return true;
    };
  }

  /// Checks if a framework error is a non-fatal error (image codec 404, missing optional plugin, stream re-subscription).
  static bool _isNonFatalFrameworkError(FlutterErrorDetails details) {
    if (details.library == 'image resource service') {
      return true;
    }
    final exceptionStr = details.exceptionAsString();
    if (exceptionStr.contains('resolving an image codec') ||
        exceptionStr.contains('Invalid statusCode') ||
        (exceptionStr.contains('HttpException') && exceptionStr.contains('uri')) ||
        (exceptionStr.contains('MissingPluginException') && exceptionStr.contains('vibration')) ||
        exceptionStr.contains('Stream has already been listened to')) {
      return true;
    }
    return false;
  }

  /// Checks if an async error is a non-fatal error (image load failure, missing optional plugin, stream re-subscription).
  static bool _isNonFatalAsyncError(Object error) {
    final errorStr = error.toString();
    if (errorStr.contains('resolving an image codec') ||
        (errorStr.contains('HttpException') && errorStr.contains('Invalid statusCode')) ||
        (errorStr.contains('MissingPluginException') && errorStr.contains('vibration')) ||
        errorStr.contains('Stream has already been listened to')) {
      return true;
    }
    return false;
  }

  /// Sets the user identifier for crash reports.
  static Future<void> setUserId(String userId) async {
    await FirebaseCrashlytics.instance.setUserIdentifier(userId);
  }

  /// Sets a custom key-value pair to be included in crash reports.
  static Future<void> setCustomKey(String key, Object value) async {
    if (value is String) {
      await FirebaseCrashlytics.instance.setCustomKey(key, value);
    } else if (value is bool) {
      await FirebaseCrashlytics.instance.setCustomKey(key, value);
    } else if (value is int) {
      await FirebaseCrashlytics.instance.setCustomKey(key, value);
    } else if (value is double) {
      await FirebaseCrashlytics.instance.setCustomKey(key, value);
    } else {
      await FirebaseCrashlytics.instance.setCustomKey(key, value.toString());
    }
  }

  /// Logs a custom message to be included in the next crash report.
  static Future<void> log(String message) async {
    await FirebaseCrashlytics.instance.log(message);
  }

  /// Manually records a non-fatal (or fatal) error.
  static Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    String? reason,
    bool fatal = false,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      exception,
      stack,
      reason: reason,
      fatal: fatal,
    );
  }
}
