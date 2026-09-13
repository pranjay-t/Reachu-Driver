import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/result.dart';
import '../models/faq_category_responses.dart';
import '../models/get_by_category_response.dart';
import '../repositories/support_repository.dart';

final faqCategoriesProvider = FutureProvider<FaqsCategoriesResponse>((ref) async {
  final repository = ref.watch(supportRepositoryProvider);
  final result = await repository.getFaqCategories();
  switch (result) {
    case Success(:final data):
      return data;
    case Failure(:final error):
      throw error;
  }
});

final faqsByCategoryProvider =
    FutureProvider.family<GetByCategoryResponse, String>((ref, category) async {
  final repository = ref.watch(supportRepositoryProvider);
  final result = await repository.getFaqsByCategory(category);
  switch (result) {
    case Success(:final data):
      return data;
    case Failure(:final error):
      throw error;
  }
});
