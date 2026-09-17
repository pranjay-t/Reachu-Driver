// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_model.freezed.dart';
part 'tutorial_model.g.dart';

@freezed
abstract class TutorialModel with _$TutorialModel {
  const factory TutorialModel({
    @JsonKey(name: '_id') required String id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String videoUrl,
    @Default('youtube') String videoSource,
    @Default(0) int durationSeconds,
    @Default('Both') String targetAudience,
    @Default([]) List<String> userRole,
    @Default('General') String category,
    @Default([]) List<String> tags,
    @Default('en') String language,
    @Default([]) List<String> platforms,
    @Default(0) int sortOrder,
    @Default(false) bool isFeatured,
    @Default(false) bool isMandatory,
    @Default(0) int views,
    String? minAppVersion,
    DateTime? publishedAt,
    @Default('Active') String status,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool watched,
  }) = _TutorialModel;

  factory TutorialModel.fromJson(Map<String, dynamic> json) =>
      _$TutorialModelFromJson(json);
}

@freezed
abstract class TutorialPagination with _$TutorialPagination {
  const factory TutorialPagination({
    @Default(0) int total,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(1) int totalPages,
  }) = _TutorialPagination;

  factory TutorialPagination.fromJson(Map<String, dynamic> json) =>
      _$TutorialPaginationFromJson(json);
}

@freezed
abstract class TutorialListResponse with _$TutorialListResponse {
  const factory TutorialListResponse({
    required bool success,
    @Default('') String message,
    @Default([]) List<TutorialModel> data,
    TutorialPagination? pagination,
  }) = _TutorialListResponse;

  factory TutorialListResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorialListResponseFromJson(json);
}

@freezed
abstract class TutorialPendingData with _$TutorialPendingData {
  const factory TutorialPendingData({
    @Default(false) bool tutorialsPending,
  }) = _TutorialPendingData;

  factory TutorialPendingData.fromJson(Map<String, dynamic> json) =>
      _$TutorialPendingDataFromJson(json);
}

@freezed
abstract class TutorialPendingResponse with _$TutorialPendingResponse {
  const factory TutorialPendingResponse({
    required bool success,
    required TutorialPendingData data,
  }) = _TutorialPendingResponse;

  factory TutorialPendingResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorialPendingResponseFromJson(json);
}
