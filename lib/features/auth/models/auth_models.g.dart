// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      phone: json['phone'] as String,
      appSignature: json['appSignature'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'appSignature': instance.appSignature,
    };

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};

_VerifyOtpRequest _$VerifyOtpRequestFromJson(Map<String, dynamic> json) =>
    _VerifyOtpRequest(
      phone: json['phone'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyOtpRequestToJson(_VerifyOtpRequest instance) =>
    <String, dynamic>{'phone': instance.phone, 'otp': instance.otp};

_IsUserExistResponse _$IsUserExistResponseFromJson(Map<String, dynamic> json) =>
    _IsUserExistResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : DriverModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IsUserExistResponseToJson(
  _IsUserExistResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_UpdateProfileResponse _$UpdateProfileResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  user: json['user'] == null
      ? null
      : DriverModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateProfileResponseToJson(
  _UpdateProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'user': instance.user,
};

_RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) =>
    _RefreshTokenRequest(refreshToken: json['refreshToken'] as String);

Map<String, dynamic> _$RefreshTokenRequestToJson(
  _RefreshTokenRequest instance,
) => <String, dynamic>{'refreshToken': instance.refreshToken};

_RefreshTokenData _$RefreshTokenDataFromJson(Map<String, dynamic> json) =>
    _RefreshTokenData(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshTokenDataToJson(_RefreshTokenData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

_RefreshTokenResponse _$RefreshTokenResponseFromJson(
  Map<String, dynamic> json,
) => _RefreshTokenResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : RefreshTokenData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RefreshTokenResponseToJson(
  _RefreshTokenResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    _LogoutResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$LogoutResponseToJson(_LogoutResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};
