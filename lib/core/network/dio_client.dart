import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'api_endpoints.dart';
import 'api_interceptors.dart';
import 'dio_performance_interceptor.dart';
import 'maintenance_update_interceptor.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
Dio dioClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ),
  );

  dio.interceptors.addAll([
    MaintenanceUpdateInterceptor(ref),
    AuthInterceptor(),
    LoggingInterceptor(),
    ErrorInterceptor(dio, ref),
    DioPerformanceInterceptor(),
  ]);
  
  return dio;
}
