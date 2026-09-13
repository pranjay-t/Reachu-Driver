import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'maintenance_update_provider.dart';

class MaintenanceUpdateInterceptor extends Interceptor {
  final Ref ref;

  MaintenanceUpdateInterceptor(this.ref);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _checkForCacheField(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _checkForCacheField(err.response?.data);
    super.onError(err, handler);
  }

  void _checkForCacheField(dynamic data) {
    if (!ref.mounted) return;
    if (data is Map) {
      final cacheData = data['cache'];
      if (cacheData is Map<String, dynamic>) {
        ref.read(maintenanceUpdateProvider.notifier).updateFromResponse(cacheData);
      }
    }
  }
}
