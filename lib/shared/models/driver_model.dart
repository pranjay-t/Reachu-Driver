// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_model.freezed.dart';
part 'driver_model.g.dart';

String _phoneFromJson(dynamic value) => value?.toString() ?? '';

@freezed
abstract class DriverModel with _$DriverModel {
  const factory DriverModel({
    @JsonKey(name: '_id') required String id,
    String? name,
    @JsonKey(fromJson: _phoneFromJson) required String phone,
    String? email,
    String? gender,
    String? image,
    String? DLImage,
    String? PANImage,
    String? aadharImageFront,
    String? aadharImageBack,
    String? imageVerificationStatus,
    String? profileVerificationStatus,
    String? vehicleVerificationStatus,
    String? isCompleteVerified,
    String? verificationStatus,
    DateTime? dateOfBirth,
    bool? isProfileCompleted,
    bool? startDuty,
    bool? disable,
    bool? isCancelledAnyOrder,
    double? rating,
    int? totalRating,
    String? preference,
    String? alternateContact1,
    String? relation1,
    String? address1,
    String? alternateContact2,
    String? relation2,
    String? address2,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) => _$DriverModelFromJson(json);
}
