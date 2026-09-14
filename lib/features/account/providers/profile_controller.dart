import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reachu_driver/core/network/result.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/driver_model.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/utils/app_logger.dart';
import '../repositories/profile_repository.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  Future<DriverModel> build() async {
    return _fetchUser();
  }

  Future<DriverModel> _fetchUser() async {
    const secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: 'auth_token');

    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }

    final decodedToken = JwtDecoder.decode(token);
    final userId = decodedToken['id'] ?? decodedToken['_id'];

    if (userId == null) {
      throw Exception('User ID not found in token');
    }

    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.getDriverById(userId);

    switch (result) {
      case Success(:final data):
        if (data.success && data.user != null) {
          final user = data.user!;
          final fullUrl = ApiEndpoints.getFullImageUrl(user.image);
          AppLogger.d("👤 [ProfileController] Driver: '${user.name}' | Image Raw: '${user.image}' | Complete URL: '$fullUrl'");
          return user;
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> refreshProfile({bool silent = false}) async {
    if (!silent) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => _fetchUser());
    } else {
      try {
        final user = await _fetchUser();
        state = AsyncValue.data(user);
      } catch (e, stack) {
        state = AsyncValue.error(e, stack);
      }
    }
  }

  void updateDutyStatusOptimistic(bool startDuty) {
    state.whenData((user) {
      state = AsyncValue.data(user.copyWith(startDuty: startDuty));
    });
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String gender,
    required String dateOfBirth,
    String? imagePath,
  }) async {
    // Keep the previous data while updating
    final previousState = state;
    state = const AsyncValue.loading();

    try {
      const secureStorage = FlutterSecureStorage();
      final token = await secureStorage.read(key: 'auth_token');
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not found');
      }

      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken['id'] ?? decodedToken['_id'];

      if (userId == null) {
        throw Exception('User ID not found in token');
      }

      final repository = ref.read(profileRepositoryProvider);
      final result = await repository.updateUserProfile(
        userId: userId,
        name: name,
        email: email,
        gender: gender,
        dateOfBirth: dateOfBirth,
        imagePath: imagePath,
      );

      switch (result) {
        case Success(:final data):
          if (data.success && data.user != null) {
            // Optimistically or accurately update state with response
            state = AsyncValue.data(data.user!);
          } else {
            state = previousState;
            throw Exception(data.message);
          }
        case Failure(:final error):
          state = previousState;
          throw Exception(NetworkExceptions.getErrorMessage(error));
      }
    } catch (e) {
      state = previousState;
      throw Exception(e.toString());
    }
  }
}
