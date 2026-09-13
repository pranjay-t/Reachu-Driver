import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/result.dart';

part 'booking_repository.g.dart';

@riverpod
BookingRepository bookingRepository(Ref ref) {
  return BookingRepository(ref.watch(apiServiceProvider));
}

class BookingRepository {
  final ApiService _apiService;

  BookingRepository(this._apiService);

  // ── Order Status ──

  Future<ApiResult<Map<String, dynamic>>> updateOrderStatus({
    required String orderId,
    required String status,
    Map<String, dynamic>? additionalData,
  }) async {
    final path = ApiEndpoints.updateOrder.replaceAll('<orderId>', orderId);
    final requestData = <String, dynamic>{
      'orderStatus': status,
      ...?additionalData,
    };

    return _apiService.patch(
      path,
      data: requestData,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  // ── Pickup OTP (POST /order/verifyOtp) ──

  Future<ApiResult<Map<String, dynamic>>> verifyPickupOtp({
    required String orderId,
    required String otp,
  }) async {
    return _apiService.post(
      ApiEndpoints.verifyOrderOtp,
      data: {
        'orderId': orderId,
        'rideOtp': otp,
      },
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  // ── Delivery OTP (PATCH /order/:orderId/delivery/verifyOtp) ──

  Future<ApiResult<Map<String, dynamic>>> verifyDeliveryOtp({
    required String orderId,
    required String otp,
  }) async {
    final path = ApiEndpoints.verifyDeliveryOtp.replaceAll('<orderId>', orderId);
    return _apiService.patch(
      path,
      data: {'otp': otp},
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  // ── Stop OTP (PATCH /order/:orderId/stops/:stopIndex/verifyOtp) ──

  Future<ApiResult<Map<String, dynamic>>> verifyStopOtp({
    required String orderId,
    required int stopIndex,
    required String otp,
  }) async {
    final path = ApiEndpoints.verifyStopOtp
        .replaceAll('<orderId>', orderId)
        .replaceAll('<stopIndex>', stopIndex.toString());
    return _apiService.patch(
      path,
      data: {'otp': otp},
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  // ── Resend OTP (POST /order/:orderId/otp/resend) ──

  Future<ApiResult<Map<String, dynamic>>> resendOtp({
    required String orderId,
    required String target,
    int? stopIndex,
  }) async {
    final path = ApiEndpoints.resendOtp.replaceAll('<orderId>', orderId);
    final data = <String, dynamic>{'target': target};
    if (stopIndex != null) {
      data['stopIndex'] = stopIndex;
    }
    return _apiService.post(
      path,
      data: data,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  // ── Driver Ride History (GET /order/driver/history) ──

  Future<ApiResult<HistoryResponse>> getDriverHistory({
    required int page,
    required int limit,
    String? status,
  }) async {
    final queryParameters = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    if (status != null) {
      queryParameters['orderStatus'] = status;
      queryParameters['status'] = status;
    }

    return _apiService.get(
      ApiEndpoints.driverHistory,
      queryParameters: queryParameters,
      converter: (data) => HistoryResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}

class HistoryPagination {
  final int page;
  final int limit;
  final int total;
  final int pages;

  HistoryPagination({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
  });

  factory HistoryPagination.fromJson(Map<String, dynamic> json) {
    return HistoryPagination(
      page: json['page'] as int? ?? 1,
      limit: json['limit'] as int? ?? 5,
      total: json['total'] as int? ?? 0,
      pages: json['pages'] as int? ?? 1,
    );
  }
}

class HistoryResponse {
  final bool success;
  final List<Map<String, dynamic>> data;
  final HistoryPagination pagination;
  final String message;

  HistoryResponse({
    required this.success,
    required this.data,
    required this.pagination,
    required this.message,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'] as List? ?? [];
    final list = rawData.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    return HistoryResponse(
      success: json['success'] as bool? ?? false,
      data: list,
      pagination: HistoryPagination.fromJson(json['pagination'] as Map<String, dynamic>? ?? {}),
      message: json['message']?.toString() ?? '',
    );
  }
}
