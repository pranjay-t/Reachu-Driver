// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) =>
    _GetUserResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      user: json['driver'] == null
          ? null
          : DriverModel.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserResponseToJson(_GetUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'driver': instance.user,
    };

_UpdateProfileResponse _$UpdateProfileResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  user: json['driver'] == null
      ? null
      : DriverModel.fromJson(json['driver'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateProfileResponseToJson(
  _UpdateProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'driver': instance.user,
};
