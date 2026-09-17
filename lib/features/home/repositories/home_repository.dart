import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/result.dart';
import '../../auth/models/onboarding_responses.dart';
import '../models/home_response.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository(ref.watch(apiServiceProvider));
}

class HomeRepository {
  final ApiService _apiService;

  HomeRepository(this._apiService);

  Future<ApiResult<HomeResponse>> getHomeData({String? cityId}) async {
    final Map<String, dynamic>? queryParams =
        (cityId != null && cityId.isNotEmpty) ? {'cityId': cityId} : null;

    return _apiService.get(
      ApiEndpoints.driverHome,
      queryParameters: queryParams,
      converter: (data) => HomeResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<DriverImageUploadResponse>> toggleDuty({
    required String driverId,
    required double latitude,
    required double longitude,
  }) async {
    final path = ApiEndpoints.toggleDuty.replaceAll('<driverId>', driverId);
    return _apiService.patch(
      path,
      data: {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
      },
      options: Options(
        extra: {'showSuccessSnackbar': false},
      ),
      converter: (data) => DriverImageUploadResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
