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
  
  ErrorInterceptor(this.dio, this.ref);

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
        final showSuccess = response.requestOptions.extra['showSuccessSnackbar'] ?? (method != 'GET');

        if (showSuccess) {
          AppSnackbar.showSuccess(message: message);
        }
      } else if (!success && message != null && message.trim().isNotEmpty) {
        AppSnackbar.showError(message: message);
      }
    }
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle Token Expiry (401 Unauthorized)
    if (err.response?.statusCode == 401 && !err.requestOptions.path.contains(ApiEndpoints.refreshToken)) {
      AppLogger.w('Token expired. Attempting to refresh...');
      
      const secureStorage = FlutterSecureStorage();
      final refreshToken = await secureStorage.read(key: 'refresh_token');

      if (refreshToken == null || refreshToken.isEmpty) {
        _forceLogout('Session expired. Please log in again.');
        return handler.reject(err);
      }

      try {
        // Make API call to refresh token using a separate dio instance.
        final tokenDio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
        final response = await tokenDio.post(
          ApiEndpoints.refreshToken,
          data: {'refreshToken': refreshToken},
        );

        if (response.statusCode == 200 && response.data['success'] == true) {
          final newAuthToken = response.data['data']['token'];
          final newRefreshToken = response.data['data']['refreshToken'];

          // Save new tokens
          await secureStorage.write(key: 'auth_token', value: newAuthToken);
          await secureStorage.write(key: 'refresh_token', value: newRefreshToken);
          if (kDebugMode) {
            AppLogger.d('🔑 Refreshed Auth Token: $newAuthToken');
          }

          // Retry the original failed request with the new token:
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAuthToken';
          
          final retryResponse = await dio.fetch(options);
          return handler.resolve(retryResponse);
        } else {
          throw Exception('Refresh token failed');
        }
      } catch (e) {
        _forceLogout('Session expired. Please log in again.');
        return handler.reject(err);
      }
    }
    
    // Handle Network / Connection errors specially
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      AppSnackbar.showError(
        message: 'Network connection issue. Please check your internet connection and try again.',
      );
      return super.onError(err, handler);
    }

    // Parse backend error messages and show toast
    final data = err.response?.data;
    String errorMessage = 'Unexpected error';
    if (data is Map) {
      final msg = data['message'] ?? data['error'];
      if (msg != null && msg.toString().trim().isNotEmpty) {
        errorMessage = msg.toString();
      }
    }
    
    AppSnackbar.showError(message: errorMessage);
    
    return super.onError(err, handler);
  }

  void _forceLogout(String message) async {
    AppSnackbar.showError(message: message);
    if (ref.mounted) {
      await ref.read(authProvider.notifier).logout();
    }
  }
}
