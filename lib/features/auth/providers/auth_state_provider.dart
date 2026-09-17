import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/auth_repository.dart';
import '../models/onboarding_enums.dart';
import '../../../core/network/result.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/socket/socket_client.dart';
import '../../support/services/support_socket_service.dart';
import 'login_controller.dart';

part 'auth_state_provider.g.dart';

enum AuthStatus {
  initial,
  unauthenticated,
  incomplete,
  pendingVerification,
  authenticated,
}

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthStatus build() {
    checkAuth();
    return AuthStatus.initial;
  }

  Future<void> checkAuth() async {
    const secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: 'auth_token');

    if (token != null && token.isNotEmpty) {
      final cachedVerifiedStatus = await secureStorage.read(key: 'verification_status');

      // 1. If cached status already confirms pending verification or approved, set immediately
      if (cachedVerifiedStatus == OverallStatus.approved || cachedVerifiedStatus == 'verified') {
        state = AuthStatus.authenticated;
      } else if (cachedVerifiedStatus == OverallStatus.actionRequired ||
          cachedVerifiedStatus == OverallStatus.pendingReview ||
          cachedVerifiedStatus == 'pending_review' ||
          cachedVerifiedStatus == 'pending') {
        state = AuthStatus.pendingVerification;
      }
      // If no valid status is cached, keep state at AuthStatus.initial (Splash) while fetching real status

      // 2. Perform network status check while user stays cleanly on Splash/Initial screen
      try {
        final authRepository = ref.read(authRepositoryProvider);
        final statusResult = await authRepository.getRegistrationStatus();
        switch (statusResult) {
          case Success(:final data):
            if (data.success && data.data != null) {
              final overallStatus = data.data!.overallStatus;
              await secureStorage.write(key: 'verification_status', value: overallStatus);

              final cityId = data.data!.personalInfo?.cityId ?? data.data!.personalInfo?.homeCityId;
              if (cityId != null && cityId.trim().isNotEmpty) {
                await secureStorage.write(key: 'driver_city_id', value: cityId.trim());
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('city_id', cityId.trim());
              }

              if (overallStatus == OverallStatus.approved || overallStatus == 'verified') {
                await secureStorage.write(key: 'profile_complete', value: 'true');
                state = AuthStatus.authenticated;
              } else if (overallStatus == OverallStatus.actionRequired ||
                  overallStatus == OverallStatus.pendingReview ||
                  overallStatus == 'pending_review' ||
                  overallStatus == 'pending') {
                await secureStorage.write(key: 'profile_complete', value: 'true');
                state = AuthStatus.pendingVerification;
              } else {
                // 'in_progress' or 'not_started'
                await secureStorage.write(key: 'profile_complete', value: 'false');
                state = AuthStatus.incomplete;
              }
              return;
            }
          case Failure():
            break;
        }
      } catch (e) {
        AppLogger.e('checkAuth: Error checking registration status on startup', error: e);
      }

      // If status query failed and no state set yet, resolve based on cached status
      if (state == AuthStatus.initial) {
        if (cachedVerifiedStatus == 'approved' || cachedVerifiedStatus == 'verified') {
          state = AuthStatus.authenticated;
        } else if (cachedVerifiedStatus == 'action_required' ||
            cachedVerifiedStatus == 'pending_review' ||
            cachedVerifiedStatus == 'pending') {
          state = AuthStatus.pendingVerification;
        } else {
          state = AuthStatus.incomplete;
        }
      }
    } else {
      state = AuthStatus.unauthenticated;
    }
  }

  Future<void> login(String token, String refreshToken) async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'auth_token', value: token);
    await secureStorage.write(key: 'refresh_token', value: refreshToken);
    await secureStorage.write(key: 'profile_complete', value: 'true');
    await secureStorage.write(key: 'verification_status', value: 'verified');
    state = AuthStatus.authenticated;
  }

  Future<void> setVerificationStatus(String status) async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'verification_status', value: status);
    if (status == 'verified' || status == OverallStatus.approved) {
      await secureStorage.write(key: 'profile_complete', value: 'true');
      state = AuthStatus.authenticated;
    } else if (status == 'pending' ||
        status == 'pending_review' ||
        status == OverallStatus.actionRequired ||
        status == OverallStatus.pendingReview) {
      await secureStorage.write(key: 'profile_complete', value: 'true');
      state = AuthStatus.pendingVerification;
    } else {
      await secureStorage.write(key: 'profile_complete', value: 'false');
      state = AuthStatus.incomplete;
    }
  }

  Future<void> setIncomplete() async {
    state = AuthStatus.incomplete;
  }

  Future<void> setPendingVerification() async {
    state = AuthStatus.pendingVerification;
  }

  Future<void> setAuthenticated() async {
    state = AuthStatus.authenticated;
  }

  Future<void> logout() async {
    AppLogger.i('🔐 [AuthNotifier] Initiating complete logout and session teardown...');

    // 1. Emit goOffline, disconnect main socket, cancel timers & stop native service
    try {
      await SocketClient().logoutAndDisconnect();
    } catch (e) {
      AppLogger.e('Error disconnecting SocketClient on logout: $e');
    }

    // 2. Disconnect Support Socket Service
    try {
      ref.read(supportSocketServiceProvider).disconnect();
    } catch (e) {
      AppLogger.e('Error disconnecting SupportSocketService on logout: $e');
    }

    // 3. Clear SharedPreferences user cache (preserving app preferences like language, theme & bucket URL)
    try {
      final prefs = await SharedPreferences.getInstance();
      const preservedKeys = {'language_code', 'is_dark_mode', 'bucket_url'};
      final keys = prefs.getKeys();
      for (final key in keys) {
        if (!preservedKeys.contains(key)) {
          await prefs.remove(key);
        }
      }
      AppLogger.d('🧹 [AuthNotifier] Cleared user session SharedPreferences keys');
    } catch (e) {
      AppLogger.e('Error clearing SharedPreferences on logout: $e');
    }

    // 4. Delete all SecureStorage entries
    try {
      const secureStorage = FlutterSecureStorage();
      await secureStorage.deleteAll();
      AppLogger.d('🧹 [AuthNotifier] Cleared SecureStorage');
    } catch (e) {
      AppLogger.e('Error clearing FlutterSecureStorage on logout: $e');
    }

    // 5. Reset LoginController UI state
    try {
      ref.read(loginControllerProvider.notifier).resetState();
    } catch (e) {
      AppLogger.e('Error resetting LoginController state on logout: $e');
    }

    // 6. Update auth state
    state = AuthStatus.unauthenticated;
  }
}
