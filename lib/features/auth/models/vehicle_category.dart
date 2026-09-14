// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_category.freezed.dart';
part 'vehicle_category.g.dart';

@freezed
abstract class VehicleCategory with _$VehicleCategory {
  const factory VehicleCategory({
    @JsonKey(name: '_id') required String id,
    String? cityId,
    required String name,
    String? image,
    double? minimumPrice,
    double? baseFare,
    bool? disable,
    List<String>? requiredDocuments,
  }) = _VehicleCategory;

  factory VehicleCategory.fromJson(Map<String, dynamic> json) => _$VehicleCategoryFromJson(json);
}

@freezed
abstract class GetAllVehicleCategoriesResponse with _$GetAllVehicleCategoriesResponse {
  const factory GetAllVehicleCategoriesResponse({
    required bool success,
    required String message,
    required List<VehicleCategory> data,
  }) = _GetAllVehicleCategoriesResponse;

  factory GetAllVehicleCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllVehicleCategoriesResponseFromJson(json);
}

@freezed
abstract class VehicleSubCategory with _$VehicleSubCategory {
  const VehicleSubCategory._();

  const factory VehicleSubCategory({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? image,
    double? minimumPrice,
    double? baseFare,
    bool? disable,
    String? cityId,
    dynamic vehicleCategoryId, // Can be String ID or nested VehicleCategory Map
    List<String>? requiredDocuments,
  }) = _VehicleSubCategory;

  factory VehicleSubCategory.fromJson(Map<String, dynamic> json) => _$VehicleSubCategoryFromJson(json);

  List<String> get effectiveRequiredDocuments {
    if (requiredDocuments != null && requiredDocuments!.isNotEmpty) {
      return requiredDocuments!;
    }
    if (vehicleCategoryId is Map) {
      final docs = vehicleCategoryId['requiredDocuments'];
      if (docs is List) {
        return docs.map((e) => e.toString()).toList();
      }
    }
    return [];
  }

  String? get categoryId {
    if (vehicleCategoryId is String) return vehicleCategoryId as String;
    if (vehicleCategoryId is Map) {
      return vehicleCategoryId['_id']?.toString() ?? vehicleCategoryId['id']?.toString();
    }
    return null;
  }
}

@freezed
abstract class GetAllSubVehicleCategoriesResponse with _$GetAllSubVehicleCategoriesResponse {
  const factory GetAllSubVehicleCategoriesResponse({
    required bool success,
    required String message,
    required List<VehicleSubCategory> data,
  }) = _GetAllSubVehicleCategoriesResponse;

  factory GetAllSubVehicleCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllSubVehicleCategoriesResponseFromJson(json);
}
