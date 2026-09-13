import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/result.dart';
import 'auth_state_provider.dart';
import '../repositories/auth_repository.dart';

part 'verification_controller.g.dart';

@riverpod
class VerificationController extends _$VerificationController {
  @override
  AsyncValue<String?> build() {
    return const AsyncValue.data(null);
  }

  Future<String?> checkVerification(String phone) async {
    final keepAliveLink = ref.keepAlive();
    try {
      state = const AsyncValue.loading();
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.getRegistrationStatus();

      if (!ref.mounted) return null;

      switch (result) {
        case Success(:final data):
          if (data.success && data.data != null) {
            final overallStatus = data.data!.overallStatus;
            state = AsyncValue.data(overallStatus);
            if (overallStatus == 'approved') {
              await ref.read(authProvider.notifier).setVerificationStatus('verified');
            } else if (overallStatus == 'action_required' || overallStatus == 'pending_review') {
              await ref.read(authProvider.notifier).setVerificationStatus(overallStatus);
            } else {
              await ref.read(authProvider.notifier).setVerificationStatus('draft');
            }
            return overallStatus;
          } else {
            state = AsyncValue.error(data.message, StackTrace.current);
            return null;
          }
        case Failure():
          state = AsyncValue.error('Verification check failed due to a network error.', StackTrace.current);
          return null;
      }
    } finally {
      keepAliveLink.close();
    }
  }
}
