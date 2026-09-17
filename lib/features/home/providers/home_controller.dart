import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/repositories/auth_repository.dart';
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

  Future<String?> _resolveCityId() async {
    try {
      // 1. Check SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      var cityId = prefs.getString('city_id');
      if (cityId != null && cityId.trim().isNotEmpty) {
        return cityId.trim();
      }

      // 2. Check FlutterSecureStorage
      const secureStorage = FlutterSecureStorage();
      cityId = await secureStorage.read(key: 'driver_city_id');
      if (cityId != null && cityId.trim().isNotEmpty) {
        await prefs.setString('city_id', cityId.trim());
        return cityId.trim();
      }

      // 3. Check JWT token
      final token = await secureStorage.read(key: 'auth_token');
      if (token != null && token.isNotEmpty) {
        final decoded = JwtDecoder.decode(token);
        final tokenCityId = decoded['cityId']?.toString() ??
            decoded['city']?.toString() ??
            decoded['homeCityId']?.toString();
        if (tokenCityId != null && tokenCityId.trim().isNotEmpty) {
          final trimmed = tokenCityId.trim();
          await prefs.setString('city_id', trimmed);
          await secureStorage.write(key: 'driver_city_id', value: trimmed);
          return trimmed;
        }
      }

      // 4. Fallback: Fetch registration status
      final authRepository = ref.read(authRepositoryProvider);
      final statusResult = await authRepository.getRegistrationStatus();
      switch (statusResult) {
        case Success(:final data):
          if (data.success && data.data != null) {
            final fetchedCityId = data.data!.personalInfo?.cityId ??
                data.data!.personalInfo?.homeCityId;
            if (fetchedCityId != null && fetchedCityId.trim().isNotEmpty) {
              final trimmed = fetchedCityId.trim();
              await prefs.setString('city_id', trimmed);
              await secureStorage.write(key: 'driver_city_id', value: trimmed);
              return trimmed;
            }
          }
        case Failure():
          break;
      }
    } catch (e) {
      AppLogger.w('⚠️ Error resolving cityId for Home API: $e');
    }
    return null;
  }

  Future<HomeData> _fetchHomeData() async {
    final cityId = await _resolveCityId();
    AppLogger.d("🏠 [HomeController._fetchHomeData] Fetching home data with cityId: '$cityId'");
    final repository = ref.read(homeRepositoryProvider);
    final result = await repository.getHomeData(cityId: cityId);

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
