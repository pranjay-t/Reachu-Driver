// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../shared/models/driver_model.dart';

part 'profile_models.freezed.dart';
part 'profile_models.g.dart';

@freezed
abstract class GetUserResponse with _$GetUserResponse {
  const factory GetUserResponse({
    required bool success,
    required String message,
    @JsonKey(name: 'driver') DriverModel? user,
  }) = _GetUserResponse;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}

@freezed
abstract class UpdateProfileResponse with _$UpdateProfileResponse {
  const factory UpdateProfileResponse({
    required bool success,
    required String message,
    @JsonKey(name: 'driver') DriverModel? user,
  }) = _UpdateProfileResponse;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}
