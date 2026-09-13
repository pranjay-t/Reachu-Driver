import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

/// Interceptor to measure API latency and report network metrics to Firebase Performance Monitoring.
class DioPerformanceInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final String url = options.uri.toString();
      final HttpMethod method = _mapMethod(options.method);
      
      final metric = FirebasePerformance.instance.newHttpMetric(url, method);
      metric.start();
      options.extra['performance_metric'] = metric;
    } catch (e) {
      // Avoid failing the request if performance logging fails
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      final metric = response.requestOptions.extra['performance_metric'] as HttpMetric?;
      if (metric != null) {
        metric.httpResponseCode = response.statusCode;
        // Optionally calculate payload size
        if (response.data != null) {
          final dataStr = response.data.toString();
          metric.responsePayloadSize = dataStr.length;
        }
        metric.stop();
      }
    } catch (e) {
      // Ignore performance logging errors to avoid breaking app flow
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      final metric = err.requestOptions.extra['performance_metric'] as HttpMetric?;
      if (metric != null) {
        if (err.response != null) {
          metric.httpResponseCode = err.response!.statusCode;
        }
        metric.stop();
      }
    } catch (e) {
      // Ignore performance logging errors
    }
    super.onError(err, handler);
  }

  HttpMethod _mapMethod(String method) {
    switch (method.toUpperCase()) {
      case 'GET':
        return HttpMethod.Get;
      case 'POST':
        return HttpMethod.Post;
      case 'PUT':
        return HttpMethod.Put;
      case 'DELETE':
        return HttpMethod.Delete;
      case 'PATCH':
        return HttpMethod.Patch;
      case 'HEAD':
        return HttpMethod.Head;
      case 'OPTIONS':
        return HttpMethod.Options;
      default:
        return HttpMethod.Get;
    }
  }
}
