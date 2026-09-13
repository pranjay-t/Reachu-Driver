import 'package:firebase_analytics/firebase_analytics.dart';

/// Service to handle event tracking and analytics logging.
class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Logs a custom event with optional parameters.
  static Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  /// Logs standard login events.
  static Future<void> logLogin({String? method}) async {
    await _analytics.logLogin(loginMethod: method);
  }

  /// Logs standard signup events.
  static Future<void> logSignUp({required String method}) async {
    await _analytics.logSignUp(signUpMethod: method);
  }

  /// Logs custom booking creation events.
  static Future<void> logBookingCreated({
    required String bookingId,
    required double amount,
    required String vehicleType,
  }) async {
    await logEvent(
      name: 'booking_created',
      parameters: {
        'booking_id': bookingId,
        'amount': amount,
        'vehicle_type': vehicleType,
      },
    );
  }

  /// Logs custom payment addition events.
  static Future<void> logPaymentAdded({
    required double amount,
    required String method,
  }) async {
    await logEvent(
      name: 'payment_added',
      parameters: {
        'amount': amount,
        'method': method,
      },
    );
  }

  /// Manually logs custom screen view events.
  static Future<void> logScreenView({required String screenName}) async {
    await _analytics.logScreenView(screenName: screenName);
  }

  /// Sets user properties for custom audiences.
  static Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}
