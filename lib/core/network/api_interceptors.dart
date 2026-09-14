import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/app_logger.dart';
import '../utils/app_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/providers/auth_state_provider.dart';
import '../firebase/app_check_service.dart';
import 'api_endpoints.dart';

/// Interceptor for adding common headers and authorization token.
class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Inject default headers
    options.headers['Content-Type'] ??= 'application/json';
    options.headers['Accept'] ??= 'application/json';

    // Inject App Check token
    try {
      final appCheckToken = await AppCheckService.getToken();
      if (appCheckToken != null) {
        options.headers['X-Firebase-AppCheck'] = appCheckToken;
      }
    } catch (e) {
      AppLogger.e('Error retrieving App Check token', error: e);
    }

    // Inject Authorization token securely
    try {
      const secureStorage = FlutterSecureStorage();
      final token = await secureStorage.read(key: 'auth_token');
      
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        if (kDebugMode) {
          AppLogger.d('🔑 Auth Token: $token');
        }
      }
    } catch (e) {
      AppLogger.e('Error retrieving auth token', error: e);
    }
    
    return super.onRequest(options, handler);
  }
}

/// Interceptor for logging API requests, responses, and errors.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.d('🌐 REQUEST[${options.method}] => PATH: ${options.path}\n'
        'Headers: ${options.headers}\n'
        'QueryParameters: ${options.queryParameters}\n'
        'Data: ${options.data}');
    
    // Store request time to calculate duration
    options.extra['start_time'] = DateTime.now().millisecondsSinceEpoch;
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final startTime = response.requestOptions.extra['start_time'] as int?;
    final duration = startTime != null ? DateTime.now().millisecondsSinceEpoch - startTime : -1;
    
    AppLogger.i('🟢 RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n'
        'Duration: ${duration}ms\n'
        'Data: ${response.data}');
        
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final startTime = err.requestOptions.extra['start_time'] as int?;
    final duration = startTime != null ? DateTime.now().millisecondsSinceEpoch - startTime : -1;
    
    AppLogger.e('🔴 ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n'
        'Duration: ${duration}ms\n'
        'Message: ${err.message}\n'
        'Data: ${err.response?.data}', error: err);
        
    return super.onError(err, handler);
  }
}

/// Interceptor for centralized API error handling and token refresh.
class ErrorInterceptor extends QueuedInterceptor {
  final Dio dio;
  final Ref ref;
  static bool _isLoggingOut = false;

  ErrorInterceptor(this.dio, this.ref);

  bool _isAuthInvalidationError({
    int? statusCode,
    required String message,
    required String path,
  }) {
    // Exclude public auth endpoints so failed logins/wrong OTP don't trigger logout recursion
    final lowerPath = path.toLowerCase();
    if (lowerPath.contains(ApiEndpoints.login.toLowerCase()) ||
        lowerPath.contains(ApiEndpoints.verifyOtp.toLowerCase()) ||
        lowerPath.contains(ApiEndpoints.refreshToken.toLowerCase()) ||
        lowerPath.contains('isuserexist')) {
      return false;
    }

    final lowerMsg = message.toLowerCase();

    // 1. Account / Driver existence or invalidation error messages
    if (lowerMsg.contains('driver not found') ||
        lowerMsg.contains('user not found') ||
        lowerMsg.contains('account not found') ||
        lowerMsg.contains('driver does not exist') ||
        lowerMsg.contains('user does not exist') ||
        lowerMsg.contains('driver is not registered') ||
        lowerMsg.contains('driver not registered') ||
        lowerMsg.contains('driver profile not found') ||
        lowerMsg.contains('account suspended') ||
        lowerMsg.contains('account deactivated') ||
        lowerMsg.contains('account blocked') ||
        lowerMsg.contains('account deleted') ||
        lowerMsg.contains('invalid token') ||
        lowerMsg.contains('token invalid') ||
        lowerMsg.contains('token expired') ||
        lowerMsg.contains('jwt expired') ||
        lowerMsg.contains('jwt malformed') ||
        lowerMsg.contains('invalid signature') ||
        lowerMsg.contains('session expired') ||
        lowerMsg.contains('unauthorized') ||
        lowerMsg.contains('unauthenticated')) {
      return true;
    }

    // 2. Status code 401 or 403 on protected routes
    if (statusCode == 401 || statusCode == 403) {
      return true;
    }

    // 3. 404 on driver-specific profile/state routes with not found
    if (statusCode == 404 &&
        (lowerPath.contains('/driver') ||
            lowerPath.contains('/order') ||
            lowerPath.contains('/wallet') ||
            lowerPath.contains('/bank-accounts') ||
            lowerPath.contains('/profile'))) {
      if (lowerMsg.contains('not found') ||
          lowerMsg.contains('driver') ||
          lowerMsg.contains('user')) {
        return true;
      }
    }

    return false;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    if (data is Map &&
        response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      final success = data['success'] ?? false;
      final message = data['message']?.toString();

      if (success && message != null && message.trim().isNotEmpty) {
        final method = response.requestOptions.method;
        final showSuccess =
            response.requestOptions.extra['showSuccessSnackbar'] ??
            (method != 'GET');

        if (showSuccess) {
          AppSnackbar.showSuccess(message: message);
        }
      } else if (!success && message != null && message.trim().isNotEmpty) {
        if (_isAuthInvalidationError(
          statusCode: response.statusCode,
          message: message,
          path: response.requestOptions.path,
        )) {
          _forceLogout(message);
        } else {
          AppSnackbar.showError(message: message);
        }
      }
    }
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // 1. Extract backend error message
    final data = err.response?.data;
    String errorMessage = 'Unexpected error';
    if (data is Map) {
      final msg = data['message'] ?? data['error'];
      if (msg != null && msg.toString().trim().isNotEmpty) {
        errorMessage = msg.toString();
      }
    }

    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;

    // 2. Immediate check for driver not found / account invalidation errors
    if (_isAuthInvalidationError(
      statusCode: statusCode,
      message: errorMessage,
      path: path,
    )) {
      // If it's a 401 on non-refresh endpoints, attempt refresh token first
      if (statusCode == 401 && !path.contains(ApiEndpoints.refreshToken)) {
        final refreshed = await _attemptTokenRefresh(err, handler);
        if (refreshed) return;
      }

      _forceLogout(errorMessage);
      return handler.reject(err);
    }

    // 3. Handle Token Expiry (401 Unauthorized) if not caught above
    if (statusCode == 401 && !path.contains(ApiEndpoints.refreshToken)) {
      final refreshed = await _attemptTokenRefresh(err, handler);
      if (refreshed) return;
      _forceLogout('Session expired. Please log in again.');
      return handler.reject(err);
    }

    // 4. Handle Network / Connection errors specially
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      AppSnackbar.showError(
        message:
            'Network connection issue. Please check your internet connection and try again.',
      );
      return super.onError(err, handler);
    }

    // 5. Show toast for other errors
    AppSnackbar.showError(message: errorMessage);

    return super.onError(err, handler);
  }

  Future<bool> _attemptTokenRefresh(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    AppLogger.w('Token expired. Attempting to refresh...');

    const secureStorage = FlutterSecureStorage();
    final refreshToken = await secureStorage.read(key: 'refresh_token');

    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    try {
      final tokenDio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
      final response = await tokenDio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final newAuthToken = response.data['data']['token'];
        final newRefreshToken = response.data['data']['refreshToken'];

        await secureStorage.write(key: 'auth_token', value: newAuthToken);
        await secureStorage.write(
          key: 'refresh_token',
          value: newRefreshToken,
        );
        if (kDebugMode) {
          AppLogger.d('🔑 Refreshed Auth Token: $newAuthToken');
        }

        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $newAuthToken';

        final retryResponse = await dio.fetch(options);
        handler.resolve(retryResponse);
        return true;
      }
    } catch (e) {
      AppLogger.e('Error during token refresh: $e');
    }
    return false;
  }

  void _forceLogout(String message) async {
    if (_isLoggingOut) return;
    _isLoggingOut = true;

    try {
      AppSnackbar.showError(message: message);
      if (ref.mounted) {
        await ref.read(authProvider.notifier).logout();
      }
    } finally {
      Future.delayed(const Duration(seconds: 2), () {
        _isLoggingOut = false;
      });
    }
  }
}
