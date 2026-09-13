// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_models.freezed.dart';
part 'rating_models.g.dart';

@freezed
abstract class ReviewRatingResponse with _$ReviewRatingResponse {
  const factory ReviewRatingResponse({
    bool? success,
    String? message,
    List<ReviewRating>? data,
  }) = _ReviewRatingResponse;

  factory ReviewRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewRatingResponseFromJson(json);
}

@freezed
abstract class ReviewRating with _$ReviewRating {
  const factory ReviewRating({
    @JsonKey(name: '_id') String? id,
    String? orderId,
    @JsonKey(name: 'userId') ReviewUser? user,
    String? driverId,
    @JsonKey(name: 'expreienceType') String? experienceType,
    @JsonKey(name: 'exprerienceDescription') String? experienceDescription,
    int? rating,
  }) = _ReviewRating;

  factory ReviewRating.fromJson(Map<String, dynamic> json) =>
      _$ReviewRatingFromJson(json);
}

@freezed
abstract class ReviewUser with _$ReviewUser {
  const factory ReviewUser({
    @JsonKey(name: '_id') String? id,
    String? name,
    dynamic phone,
    String? image,
  }) = _ReviewUser;

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserFromJson(json);
}
