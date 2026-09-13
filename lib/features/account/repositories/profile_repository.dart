import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/network/result.dart';
import '../../../core/utils/app_logger.dart';
import '../models/profile_models.dart';
import '../models/rating_models.dart';

part 'profile_repository.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(apiServiceProvider));
}

class ProfileRepository {
  final ApiService _apiService;

  ProfileRepository(this._apiService);

  Future<ApiResult<ReviewRatingResponse>> getDriverRatings() async {
    return _apiService.get(
      ApiPath.getDriverRatings,
      converter: (data) => ReviewRatingResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<GetUserResponse>> getDriverById(String userId) async {
    final path = ApiEndpoints.getDriverById.replaceAll('<driverId>', userId);

    return _apiService.get(
      path,
      converter: (data) {
        try {
          final rawMap = data as Map<String, dynamic>;
          Map? vehicle;
          if (rawMap.containsKey('vehicle') && rawMap['vehicle'] is Map) {
            vehicle = rawMap['vehicle'] as Map;
          } else if (rawMap.containsKey('driver') && rawMap['driver'] is Map) {
            final driverData = rawMap['driver'] as Map;
            if (driverData.containsKey('vehicle') && driverData['vehicle'] is Map) {
              vehicle = driverData['vehicle'] as Map;
            }
          } else if (rawMap.containsKey('data') && rawMap['data'] is Map) {
            final dataMap = rawMap['data'] as Map;
            if (dataMap.containsKey('vehicle') && dataMap['vehicle'] is Map) {
              vehicle = dataMap['vehicle'] as Map;
            }
          }

          final vehicleMapImage = rawMap['vehicleMapImage']?.toString() ??
              (rawMap['driver'] is Map ? (rawMap['driver'] as Map)['vehicleMapImage']?.toString() : null) ??
              (rawMap['data'] is Map ? (rawMap['data'] as Map)['vehicleMapImage']?.toString() : null) ?? "";

          if (vehicleMapImage.isNotEmpty) {
            SharedPreferences.getInstance().then((prefs) {
              prefs.setString("vehicle_map_image", vehicleMapImage);
              AppLogger.d("🚗 [ProfileRepository] Saved vehicle_map_image: $vehicleMapImage");
            });
          }

          if (vehicle != null) {
            final vehicleId = vehicle['_id']?.toString() ?? vehicle['id']?.toString() ?? "";
            final vehicleType = vehicle['vehicleType']?.toString() ?? "";
            final vehicleSubType = vehicle['vehicleSubType']?.toString() ?? "";
            final vehicleName = vehicle['vehicleName']?.toString() ?? "";
            final vehicleNumber = vehicle['vehicleNumber']?.toString() ?? "";

            SharedPreferences.getInstance().then((prefs) {
              if (vehicleId.isNotEmpty) {
                prefs.setString("vehicle_id", vehicleId);
                AppLogger.d("🚗 [ProfileRepository] Saved vehicle_id: $vehicleId");
              }
              if (vehicleType.isNotEmpty) {
                prefs.setString("vehicle_type_id", vehicleType);
                AppLogger.d("🚗 [ProfileRepository] Saved vehicle_type_id: $vehicleType");
              }
              if (vehicleSubType.isNotEmpty) {
                prefs.setString("vehicle_SubType", vehicleSubType);
                AppLogger.d("🚗 [ProfileRepository] Saved vehicle_SubType: $vehicleSubType");
              }
              if (vehicleName.isNotEmpty) {
                prefs.setString("vehicle_name", vehicleName);
              }
              if (vehicleNumber.isNotEmpty) {
                prefs.setString("vehicle_number", vehicleNumber);
              }
            });
          }
        } catch (e) {
          AppLogger.e("❌ Error parsing vehicle from profile raw data: $e");
        }
        return GetUserResponse.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  Future<ApiResult<UpdateProfileResponse>> updateUserProfile({
    required String userId,
    required String name,
    required String email,
    required String gender,
    required String dateOfBirth,
    String? imagePath,
  }) async {
    final path = ApiEndpoints.updateUserProfile.replaceAll(
      '<driverId>',
      userId,
    );

    final Map<String, dynamic> fields = {
      'name': name,
      'email': email,
      'gender': gender,
    };

    if (dateOfBirth.trim().isNotEmpty) {
      fields['dateOfBirth'] = dateOfBirth;
    }

    final formData = FormData.fromMap(fields);

    if (imagePath != null && imagePath.isNotEmpty) {
      formData.files.add(
        MapEntry('image', await MultipartFile.fromFile(imagePath)),
      );
    }

    final result = await _apiService.put(
      path,
      data: formData,
      converter: (data) =>
          UpdateProfileResponse.fromJson(data as Map<String, dynamic>),
    );

    switch (result) {
      case Success():
        return result;
      case Failure():
        // If PUT returns 404 (e.g. Cannot PUT /api/v1/driver/update), try POST then PATCH
        final postResult = await _apiService.post(
          path,
          data: formData,
          converter: (data) =>
              UpdateProfileResponse.fromJson(data as Map<String, dynamic>),
        );
        if (postResult is Success) return postResult;

        return _apiService.patch(
          path,
          data: formData,
          converter: (data) =>
              UpdateProfileResponse.fromJson(data as Map<String, dynamic>),
        );
    }
  }
}
