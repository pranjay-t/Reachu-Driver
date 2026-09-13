import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../shared/models/driver_model.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String phone,
    String? appSignature,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool success,
    required String message,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String phone, 
    required String otp,
    // TODO: Include these when fetching real tokens
    // String? fcmToken,
    // String? deviceId,
  }) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);
}

@freezed
abstract class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({
    required bool success,
    required String message,
    DriverModel? user,
    String? token,
    String? refreshToken,
  }) = _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> payload = json;
    if (json['data'] is Map<String, dynamic>) {
      payload = Map<String, dynamic>.from(json['data'] as Map);
    }
    return VerifyOtpResponse(
      success: json['success'] as bool? ?? payload['success'] as bool? ?? true,
      message: json['message'] as String? ?? payload['message'] as String? ?? '',
      user: payload['user'] != null
          ? DriverModel.fromJson(payload['user'] as Map<String, dynamic>)
          : (json['user'] != null
              ? DriverModel.fromJson(json['user'] as Map<String, dynamic>)
              : null),
      token: (payload['token'] ?? json['token']) as String?,
      refreshToken: (payload['refreshToken'] ?? json['refreshToken']) as String?,
    );
  }
}

@freezed
abstract class IsUserExistResponse with _$IsUserExistResponse {
  const factory IsUserExistResponse({
    required bool success,
    DriverModel? data,
  }) = _IsUserExistResponse;

  factory IsUserExistResponse.fromJson(Map<String, dynamic> json) =>
      _$IsUserExistResponseFromJson(json);
}

@freezed
abstract class UpdateProfileResponse with _$UpdateProfileResponse {
  const factory UpdateProfileResponse({
    required bool success,
    required String message,
    DriverModel? user,
  }) = _UpdateProfileResponse;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}

@freezed
abstract class RefreshTokenRequest with _$RefreshTokenRequest {
  const factory RefreshTokenRequest({
    required String refreshToken,
  }) = _RefreshTokenRequest;

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);
}

@freezed
abstract class RefreshTokenData with _$RefreshTokenData {
  const factory RefreshTokenData({
    required String token,
    required String refreshToken,
  }) = _RefreshTokenData;

  factory RefreshTokenData.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDataFromJson(json);
}

@freezed
abstract class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    required bool success,
    required String message,
    RefreshTokenData? data,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}

@freezed
abstract class LogoutResponse with _$LogoutResponse {
  const factory LogoutResponse({
    required bool success,
    required String message,
  }) = _LogoutResponse;

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}
