import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/result.dart';
import '../../../core/socket/socket_stream_manager.dart';
import '../../../core/utils/app_logger.dart';
import '../models/home_response.dart';
import '../repositories/home_repository.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<HomeData> build() async {
    return _fetchHomeData();
  }

  Future<HomeData> _fetchHomeData() async {
    final repository = ref.read(homeRepositoryProvider);
    final result = await repository.getHomeData();

    switch (result) {
      case Success(:final data):
        if (data.success) {
          final driver = data.data.driver;
          final fullUrl = ApiEndpoints.getFullImageUrl(driver.image);
          AppLogger.d("👤 [HomeController.getHomeData] Driver: '${driver.name}' | Image Raw: '${driver.image}' | Complete URL: '$fullUrl'");
          return data.data;
        } else {
          throw Exception(data.message);
        }
      case Failure():
        throw Exception('Failed to fetch home details.');
    }
  }

  Future<void> refreshHome({bool silent = false}) async {
    if (!silent) {
      state = const AsyncValue.loading();
    }
    state = await AsyncValue.guard(() => _fetchHomeData());
  }

  bool _isToggling = false;

  Future<bool> toggleDutyStatus(bool startDuty) async {
    if (_isToggling) {
      AppLogger.w('📡 Already toggling duty status. Ignoring duplicate request.');
      return false;
    }
    _isToggling = true;

    try {
      // 1. Get the current state to check backend isOnline status
      final currentState = state.value;
      final currentBackendStatus = currentState?.driver.isOnline ?? false;
      
      // If the backend is already in the desired state, we don't need to call the toggle API
      if (currentBackendStatus == startDuty) {
        AppLogger.d('📡 Backend isOnline is already $startDuty. Skipping API toggle.');
        return true;
      }

      const secureStorage = FlutterSecureStorage();
      final token = await secureStorage.read(key: 'auth_token');
      if (token == null || token.isEmpty) {
        AppLogger.e('❌ Cannot toggle duty: auth_token is missing');
        return false;
      }

      final decodedToken = JwtDecoder.decode(token);
      final driverId = decodedToken['id'] ?? decodedToken['_id'] ?? '';
      if (driverId.isEmpty) {
        AppLogger.e('❌ Cannot toggle duty: driverId is missing in token');
        return false;
      }

      final socketClient = ref.read(socketClientProvider);
      final double lat = socketClient.currentLatitude;
      final double lng = socketClient.currentLongitude;

      AppLogger.d('📡 Toggling duty status on backend to $startDuty for driver: $driverId (Location: $lat, $lng)');

      final repository = ref.read(homeRepositoryProvider);
      final result = await repository.toggleDuty(
        driverId: driverId,
        latitude: lat,
        longitude: lng,
      );

      switch (result) {
        case Success(:final data):
          if (data.success) {
            await refreshHome(silent: true);
            return true;
          }
          return false;
        case Failure():
          return false;
      }
    } catch (e) {
      AppLogger.e('❌ Error toggling duty status: $e');
      return false;
    } finally {
      _isToggling = false;
    }
  }
}
