import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// A production-level logger to be used throughout the app.
/// In debug mode, it prints logs with colors and formatting.
/// In release mode, it can be configured to only log warnings/errors
/// and send them to a crash reporting service like Firebase Crashlytics.
class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger( 
    printer: PrettyPrinter(
      methodCount: 2, 
      errorMethodCount: 8, 
      lineLength: 120, 
      colors: true, 
      printEmojis: true, 
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    // In debug mode log everything, in release mode only warnings and above
    level: kDebugMode ? Level.debug : Level.warning, 
  );

  /// Log a message at level [Level.trace].
  static void t(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode && message is String) {
      _printRobust(message);
    } else {
      _logger.d(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode && message is String) {
      _printRobust(message);
    } else {
      _logger.i(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode && message is String) {
      _printRobust(message);
    } else {
      _logger.w(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode && message is String) {
      _printRobust(message);
    } else {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
    
    if (!kDebugMode) {
      // TODO(Production): Send to Firebase Crashlytics or similar service
      // e.g. FirebaseCrashlytics.instance.recordError(error ?? message, stackTrace);
    }
  }

  /// Log a message at level [Level.fatal].
  static void f(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode && message is String) {
      _printRobust(message);
    } else {
      _logger.f(message, error: error, stackTrace: stackTrace);
    }
    
    if (!kDebugMode) {
      // TODO(Production): Send to Firebase Crashlytics or similar service
    }
  }

  static void _printRobust(String message) {
    final lines = message.split('\n');
    for (final line in lines) {
      if (line.length > 800) {
        int start = 0;
        while (start < line.length) {
          int end = start + 800;
          if (end > line.length) end = line.length;
          debugPrint(line.substring(start, end));
          start = end;
        }
      } else {
        debugPrint(line);
      }
    }
  }
}
