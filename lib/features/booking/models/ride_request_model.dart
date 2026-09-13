// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_request_model.freezed.dart';
part 'ride_request_model.g.dart';

double _doubleFromJson(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) {
    return double.tryParse(value) ?? 0.0;
  }
  return 0.0;
}

int _intFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) {
    return int.tryParse(value) ?? 0;
  }
  return 0;
}

String _stringFromJson(dynamic value) {
  if (value == null) return '';
  return value.toString();
}

@freezed
abstract class LatLngModel with _$LatLngModel {
  const factory LatLngModel({
    @JsonKey(fromJson: _doubleFromJson) required double latitude,
    @JsonKey(fromJson: _doubleFromJson) required double longitude,
  }) = _LatLngModel;

  factory LatLngModel.fromJson(Map<String, dynamic> json) =>
      _$LatLngModelFromJson(json);
}

@freezed
abstract class LocationDetailsModel with _$LocationDetailsModel {
  const factory LocationDetailsModel({
    required String address,
    required String type,
    required List<double> coordinates,
  }) = _LocationDetailsModel;

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsModelFromJson(json);
}

@freezed
abstract class FareBreakdownModel with _$FareBreakdownModel {
  const factory FareBreakdownModel({
    required String currency,
    @JsonKey(fromJson: _doubleFromJson) required double baseFare,
    @JsonKey(fromJson: _doubleFromJson) required double weatherSurcharge,
    @JsonKey(fromJson: _doubleFromJson) required double trafficSurcharge,
    @JsonKey(fromJson: _doubleFromJson) required double waitingCharge,
    double? rental,
    @JsonKey(fromJson: _doubleFromJson) required double grossFare,
    String? promoCode,
    @JsonKey(fromJson: _doubleFromJson) required double promoCodeDiscount,
    @JsonKey(fromJson: _doubleFromJson) required double pendingDue,
    @JsonKey(fromJson: _doubleFromJson) required double netPayable,
  }) = _FareBreakdownModel;

  factory FareBreakdownModel.fromJson(Map<String, dynamic> json) =>
      _$FareBreakdownModelFromJson(json);
}

@freezed
abstract class GoodsDetailsModel with _$GoodsDetailsModel {
  const factory GoodsDetailsModel({
    required String goodsType,
    required String description,
    @JsonKey(fromJson: _doubleFromJson) required double estimatedWeight,
    @JsonKey(fromJson: _doubleFromJson) required double quantity,
    @JsonKey(fromJson: _doubleFromJson) required double worth,
    required bool isFragile,
  }) = _GoodsDetailsModel;

  factory GoodsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailsModelFromJson(json);
}

@freezed
abstract class StopModel with _$StopModel {
  const factory StopModel({
    required String address,
    required String type,
    required List<double> coordinates,
    required String receiverName,
    @JsonKey(fromJson: _stringFromJson) required String receiverPhone,
    required String instructions,
    required String otp,
    required bool otpVerified,
    @JsonKey(name: '_id') required String id,
  }) = _StopModel;

  factory StopModel.fromJson(Map<String, dynamic> json) =>
      _$StopModelFromJson(json);
}

@freezed
abstract class ContactDetailsModel with _$ContactDetailsModel {
  const factory ContactDetailsModel({
    required String name,
    @JsonKey(fromJson: _stringFromJson) required String phone,
    required String instructions,
  }) = _ContactDetailsModel;

  factory ContactDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsModelFromJson(json);
}

@freezed
abstract class RideRequestModel with _$RideRequestModel {
  const factory RideRequestModel({
    required String rideId,
    required String riderId,
    required String riderName,
    @JsonKey(fromJson: _stringFromJson) required String riderNumber,
    required LatLngModel pickup,
    required LatLngModel destination,
    required String rideType,
    @JsonKey(fromJson: _doubleFromJson) required double driverDistance,
    @JsonKey(fromJson: _intFromJson) required int timestamp,
    @JsonKey(fromJson: _intFromJson) required int timeout,
    required LocationDetailsModel startLocation,
    required LocationDetailsModel endLocation,
    @JsonKey(fromJson: _doubleFromJson) required double totalFare,
    @JsonKey(fromJson: _doubleFromJson) required double distance,
    required bool isScheduled,
    DateTime? scheduledStartTime,
    @JsonKey(fromJson: _doubleFromJson) required double pendingDue,
    int? rentalDurationHours,
    required String goodsType,
    @JsonKey(fromJson: _doubleFromJson) required double estimatedWeight,
    required bool isFragile,
    @JsonKey(fromJson: _intFromJson) required int stopsCount,
    required String senderName,
    required String receiverName,
    required FareBreakdownModel fareBreakdown,
    required GoodsDetailsModel goodsDetails,
    required List<StopModel> stops,
    required ContactDetailsModel senderDetails,
    required ContactDetailsModel receiverDetails,
  }) = _RideRequestModel;

  factory RideRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RideRequestModelFromJson(json);
}
