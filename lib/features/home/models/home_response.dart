// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_response.freezed.dart';
part 'home_response.g.dart';

double _doubleFromJson(dynamic json) {
  if (json == null) return 0.0;
  if (json is num) return json.toDouble();
  if (json is String) return double.tryParse(json) ?? 0.0;
  return 0.0;
}

@freezed
abstract class HomeDriverInfo with _$HomeDriverInfo {
  const factory HomeDriverInfo({
    required String id,
    required String name,
    String? image,
    @Default(false) @JsonKey(name: 'isOnline') bool isOnline,
    String? verificationStatus,
    String? imageVerificationStatus,
    @Default(true) bool willGetOrder,
    @Default(false) bool onboardingComplete,
    double? rating,
    @Default(false) bool lowBalance,
    @JsonKey(fromJson: _doubleFromJson) @Default(0.0) double driverWalletLimit,
  }) = _HomeDriverInfo;

  factory HomeDriverInfo.fromJson(Map<String, dynamic> json) => _$HomeDriverInfoFromJson(json);
}

@freezed
abstract class DocumentSubmissionStatus with _$DocumentSubmissionStatus {
  const factory DocumentSubmissionStatus({
    @Default(false) bool isPending,
    String? status,
    String? message,
    Map<String, dynamic>? registration,
  }) = _DocumentSubmissionStatus;

  factory DocumentSubmissionStatus.fromJson(Map<String, dynamic> json) =>
      _$DocumentSubmissionStatusFromJson(json);
}

@freezed
abstract class EarningsStats with _$EarningsStats {
  const factory EarningsStats({
    required double total,
    required double cash,
    required double online,
  }) = _EarningsStats;

  factory EarningsStats.fromJson(Map<String, dynamic> json) => _$EarningsStatsFromJson(json);
}

@freezed
abstract class RidesStats with _$RidesStats {
  const factory RidesStats({
    required int total,
    required int completed,
    required int cancelled,
  }) = _RidesStats;

  factory RidesStats.fromJson(Map<String, dynamic> json) => _$RidesStatsFromJson(json);
}

@freezed
abstract class TodayStats with _$TodayStats {
  const factory TodayStats({
    required EarningsStats earnings,
    required RidesStats rides,
  }) = _TodayStats;

  factory TodayStats.fromJson(Map<String, dynamic> json) => _$TodayStatsFromJson(json);
}

@freezed
abstract class HomeData with _$HomeData {
  const factory HomeData({
    required HomeDriverInfo driver,
    required DocumentSubmissionStatus documentSubmission,
    required TodayStats todayStats,
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);
}

@freezed
abstract class HomeResponse with _$HomeResponse {
  const factory HomeResponse({
    required bool success,
    required String message,
    required HomeData data,
  }) = _HomeResponse;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);
}
