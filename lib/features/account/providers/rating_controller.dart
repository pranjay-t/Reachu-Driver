import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/network/result.dart';
import '../models/rating_models.dart';
import '../repositories/profile_repository.dart';

part 'rating_controller.g.dart';

@riverpod
class RatingController extends _$RatingController {
  @override
  Future<List<ReviewRating>> build() async {
    return _fetchRatings();
  }

  Future<List<ReviewRating>> _fetchRatings() async {
    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.getDriverRatings();

    switch (result) {
      case Success(:final data):
        if (data.success == true && data.data != null) {
          return data.data!;
        } else {
          return [];
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> refreshRatings() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchRatings());
  }
}

extension RatingListExtension on List<ReviewRating> {
  double get averageRating {
    if (isEmpty) return 0.0;
    double sum = 0;
    for (final item in this) {
      sum += (item.rating ?? 0).toDouble();
    }
    return sum / length;
  }
}
