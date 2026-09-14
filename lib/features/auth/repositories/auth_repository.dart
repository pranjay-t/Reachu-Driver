import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/result.dart';
import '../models/auth_models.dart';
import '../models/city_model.dart';
import '../models/vehicle_category.dart';
import '../models/onboarding_responses.dart';
import '../models/driver_registration_status_response.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref.watch(apiServiceProvider));
}

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<void> saveTokens(String token, String refreshToken) async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'auth_token', value: token);
    await secureStorage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<void> clearTokens() async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: 'auth_token');
    await secureStorage.delete(key: 'refresh_token');
  }

  Future<ApiResult<LoginResponse>> sendOtp(LoginRequest request) async {
    return _apiService.post(
      ApiEndpoints.login,
      data: request.toJson(),
      converter: (data) => LoginResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest request) async {
    return _apiService.post(
      ApiEndpoints.verifyOtp,
      data: request.toJson(),
      converter: (data) => VerifyOtpResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<IsUserExistResponse>> isUserExist(String phone) async {
    final path = ApiEndpoints.userExist.replaceAll('<phone>', phone);
    return _apiService.get(
      path,
      converter: (data) => IsUserExistResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<GetAllVehicleCategoriesResponse>> getVehicleCategories() async {
    return _apiService.get(
      ApiEndpoints.getAllVehicleCategories,
      converter: (data) => GetAllVehicleCategoriesResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<GetAllSubVehicleCategoriesResponse>> getVehicleSubCategories(String categoryId) async {
    return _apiService.get(
      ApiEndpoints.getAllVehicleSubCategories,
      queryParameters: {
        'vehicleCategoryId': categoryId,
        'categoryId': categoryId,
      },
      converter: (data) => GetAllSubVehicleCategoriesResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<CreateVehicleResponse>> createVehicle(FormData formData) async {
    return _apiService.post(
      ApiEndpoints.createVehicle,
      data: formData,
      converter: (data) => CreateVehicleResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<RegisterProfileResponse>> registerDriver(FormData formData) async {
    return _apiService.post(
      ApiEndpoints.driverRegister,
      data: formData,
      converter: (data) => RegisterProfileResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<DriverImageUploadResponse>> uploadSelfie(FormData formData) async {
    return _apiService.put(
      ApiEndpoints.driverUpdate,
      data: formData,
      converter: (data) => DriverImageUploadResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<DriverRegistrationStatusResponse>> getRegistrationStatus() async {
    return _apiService.get(
      ApiEndpoints.driverRegistrationStatus,
      options: Options(
        extra: {'showSuccessSnackbar': false},
      ),
      converter: (data) => DriverRegistrationStatusResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<GetActiveCitiesResponse>> getActiveCities() async {
    return _apiService.get(
      ApiEndpoints.getActiveCities,
      converter: (data) => GetActiveCitiesResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<Map<String, dynamic>>> submitPersonalInfo({
    required String name,
    required String email,
    required String dateOfBirth,
    required String gender,
    String? cityId,
  }) async {
    final Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
    if (cityId != null && cityId.isNotEmpty) {
      body['cityId'] = cityId;
    }
    return _apiService.post(
      ApiEndpoints.driverStepPersonalInfo,
      data: body,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  Future<ApiResult<Map<String, dynamic>>> submitProfilePhoto(FormData formData) async {
    return _apiService.post(
      ApiEndpoints.driverStepProfilePhoto,
      data: formData,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  Future<ApiResult<Map<String, dynamic>>> submitDrivingLicense(FormData formData) async {
    return _apiService.post(
      ApiEndpoints.driverStepDrivingLicense,
      data: formData,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  Future<ApiResult<Map<String, dynamic>>> submitAadhar(FormData formData) async {
    return _apiService.post(
      ApiEndpoints.driverStepAadhar,
      data: formData,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  Future<ApiResult<Map<String, dynamic>>> submitPan(FormData formData) async {
    return _apiService.post(
      ApiEndpoints.driverStepPan,
      data: formData,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  Future<ApiResult<Map<String, dynamic>>> submitVehicleDetails(FormData formData) async {
    return _apiService.post(
      ApiEndpoints.driverStepVehicleDetails,
      data: formData,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  Future<ApiResult<Map<String, dynamic>>> resubmitDocument(
    String stepId,
    FormData formData,
  ) async {
    return _apiService.post(
      ApiEndpoints.driverRegistrationResubmit(stepId),
      data: formData,
      converter: (data) => data as Map<String, dynamic>,
    );
  }

  Future<ApiResult<RefreshTokenResponse>> refreshToken(String refreshToken) async {
    return _apiService.post(
      ApiEndpoints.refreshToken,
      data: {'refreshToken': refreshToken},
      converter: (data) => RefreshTokenResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<LogoutResponse>> logout() async {
    return _apiService.post(
      ApiEndpoints.logout,
      converter: (data) => LogoutResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
