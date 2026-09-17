import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/result.dart';
import '../models/tutorial_model.dart';

part 'tutorial_repository.g.dart';

@riverpod
TutorialRepository tutorialRepository(Ref ref) {
  return TutorialRepository(ref.watch(apiServiceProvider));
}

class TutorialRepository {
  final ApiService _apiService;

  TutorialRepository(this._apiService);

  /// Checks whether any mandatory tutorials are pending for the driver
  Future<ApiResult<TutorialPendingResponse>> getPendingStatus() async {
    return _apiService.get(
      ApiEndpoints.tutorialsPending,
      converter: (data) =>
          TutorialPendingResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Fetches tutorials list for the driver
  Future<ApiResult<TutorialListResponse>> getTutorials({
    int page = 1,
    int limit = 50,
  }) async {
    return _apiService.get(
      ApiEndpoints.driverTutorials,
      queryParameters: {
        'page': page,
        'limit': limit,
      },
      converter: (data) =>
          TutorialListResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Marks a specific tutorial as watched
  Future<ApiResult<bool>> markTutorialWatched(String tutorialId) async {
    return _apiService.post(
      ApiEndpoints.watchTutorial(tutorialId),
      data: <String, dynamic>{},
      converter: (data) {
        if (data is Map) {
          return data['success'] as bool? ?? true;
        }
        return true;
      },
    );
  }
}
