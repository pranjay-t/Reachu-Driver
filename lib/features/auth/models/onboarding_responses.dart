// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../shared/models/driver_model.dart';

part 'onboarding_responses.freezed.dart';
part 'onboarding_responses.g.dart';

@freezed
abstract class VehicleInfo with _$VehicleInfo {
  const factory VehicleInfo({
    @JsonKey(name: '_id') required String id,
    required String vehicleName,
    required String vehicleNumber,
    String? vehicleType,
    String? vehicleColor,
    String? vehicleModel,
    int? vehicleYear,
    double? vehicleCapacity,
    String? vehicleStatus,
    String? driverId,
    String? verificationStatus,
    bool? disable,
  }) = _VehicleInfo;

  factory VehicleInfo.fromJson(Map<String, dynamic> json) => _$VehicleInfoFromJson(json);
}

@freezed
abstract class CreateVehicleResponse with _$CreateVehicleResponse {
  const factory CreateVehicleResponse({
    required bool success,
    required String message,
    required List<VehicleInfo> vehicle,
  }) = _CreateVehicleResponse;

  factory CreateVehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateVehicleResponseFromJson(json);
}

@freezed
abstract class RegisterProfileResponse with _$RegisterProfileResponse {
  const factory RegisterProfileResponse({
    required bool success,
    required String message,
    required DriverModel data,
  }) = _RegisterProfileResponse;

  factory RegisterProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterProfileResponseFromJson(json);
}

@freezed
abstract class DriverImageUploadResponse with _$DriverImageUploadResponse {
  const factory DriverImageUploadResponse({
    required bool success,
    required String message,
    required DriverModel driver,
  }) = _DriverImageUploadResponse;

  factory DriverImageUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverImageUploadResponseFromJson(json);
}

@freezed
abstract class CheckVerificationResponse with _$CheckVerificationResponse {
  const factory CheckVerificationResponse({
    required bool success,
    required String message,
    required String status, // 'draft' | 'pending' | 'verified' | 'rejected'
    required bool isDriver,
    Map<String, dynamic>? data,
    String? token,
    String? driverId,
  }) = _CheckVerificationResponse;

  factory CheckVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckVerificationResponseFromJson(json);
}
