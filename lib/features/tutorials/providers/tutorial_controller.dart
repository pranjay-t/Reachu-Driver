import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/result.dart';
import '../../../core/utils/app_logger.dart';
import '../models/tutorial_model.dart';
import '../repositories/tutorial_repository.dart';

part 'tutorial_controller.g.dart';

/// Provider to check if there are pending tutorials for the driver
@Riverpod(keepAlive: true)
class PendingTutorialsNotifier extends _$PendingTutorialsNotifier {
  @override
  Future<bool> build() async {
    return checkPendingStatus();
  }

  Future<bool> checkPendingStatus() async {
    try {
      final repository = ref.read(tutorialRepositoryProvider);
      final result = await repository.getPendingStatus();

      switch (result) {
        case Success(:final data):
          final isPending = data.data.tutorialsPending;
          AppLogger.d('🎓 [PendingTutorialsNotifier] Pending Status: $isPending');
          state = AsyncValue.data(isPending);
          return isPending;
        case Failure(:final error):
          AppLogger.e('⚠️ [PendingTutorialsNotifier] Error fetching pending status: $error');
          // If error occurs, do not block driver unnecessarily
          state = const AsyncValue.data(false);
          return false;
      }
    } catch (e) {
      AppLogger.e('⚠️ [PendingTutorialsNotifier] Exception checking pending status: $e');
      state = const AsyncValue.data(false);
      return false;
    }
  }

  void setPending(bool isPending) {
    state = AsyncValue.data(isPending);
  }
}

/// Controller managing mandatory tutorials list and watch actions
@Riverpod(keepAlive: true)
class TutorialsController extends _$TutorialsController {
  @override
  Future<List<TutorialModel>> build() async {
    return _fetchTutorials();
  }

  Future<List<TutorialModel>> _fetchTutorials() async {
    final repository = ref.read(tutorialRepositoryProvider);
    final result = await repository.getTutorials();

    switch (result) {
      case Success(:final data):
        final list = List<TutorialModel>.from(data.data);
        
        // Sort: mandatory first, then by sortOrder
        list.sort((a, b) {
          if (a.isMandatory != b.isMandatory) {
            return a.isMandatory ? -1 : 1;
          }
          return a.sortOrder.compareTo(b.sortOrder);
        });

        AppLogger.d(
          '🎓 [TutorialsController] Fetched ${list.length} total tutorials (${list.where((t) => t.isMandatory).length} mandatory)',
        );
        return list;
      case Failure(:final error):
        AppLogger.e('❌ [TutorialsController] Failed to fetch tutorials: $error');
        throw Exception('Failed to load training tutorials.');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchTutorials());
  }

  /// Automatically marks a tutorial as watched and updates state
  Future<bool> markWatched(String tutorialId) async {
    final currentList = state.value ?? [];
    
    // Find tutorial
    final index = currentList.indexWhere((t) => t.id == tutorialId);
    if (index == -1) return false;

    // If already watched, nothing to do
    if (currentList[index].watched) return true;

    // 1. Update local state immediately so UI updates without lag
    final updatedList = List<TutorialModel>.from(currentList);
    updatedList[index] = updatedList[index].copyWith(watched: true);
    state = AsyncValue.data(updatedList);

    // 2. If all MANDATORY tutorials are watched now, update pending provider immediately
    final mandatoryList = updatedList.where((t) => t.isMandatory).toList();
    final allMandatoryDone =
        mandatoryList.isEmpty || mandatoryList.every((t) => t.watched);
    if (allMandatoryDone) {
      ref.read(pendingTutorialsProvider.notifier).setPending(false);
    }

    // 3. Fire API to persist on backend
    try {
      final repository = ref.read(tutorialRepositoryProvider);
      final result = await repository.markTutorialWatched(tutorialId);

      switch (result) {
        case Success():
          AppLogger.d('✅ [TutorialsController] Tutorial $tutorialId persisted as watched on server');
          if (!allMandatoryDone) {
            ref.read(pendingTutorialsProvider.notifier).checkPendingStatus();
          }
          return true;
        case Failure(:final error):
          AppLogger.w('⚠️ [TutorialsController] Server reported error for $tutorialId, keeping local watched status: $error');
          // Keep local watched status so driver doesn't see green tick disappear
          return false;
      }
    } catch (e) {
      AppLogger.e('⚠️ [TutorialsController] Exception marking tutorial watched: $e');
      return false;
    }
  }
}
