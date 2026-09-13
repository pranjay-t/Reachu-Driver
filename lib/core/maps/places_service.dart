import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'places_models.dart';
import '../utils/app_logger.dart';

part 'places_service.g.dart';

@riverpod
PlacesService placesService(Ref ref) {
  return PlacesService();
}

class PlacesService {
  final Dio _dio;
  final Uuid _uuid;
  String? _sessionToken;
  CancelToken? _cancelToken;

  PlacesService()
      : _dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        )),
        _uuid = const Uuid();

  String get _apiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  /// Generates a new session token if one doesn't exist.
  /// This token is used to group autocomplete and place detail requests
  /// to optimize Google Places API billing.
  void _ensureSessionToken() {
    _sessionToken ??= _uuid.v4();
  }

  /// Clears the session token after a place is selected and details are fetched.
  void clearSessionToken() {
    _sessionToken = null;
  }

  /// Cancels the currently pending request.
  void cancelPendingRequest() {
    _cancelToken?.cancel('Cancelled due to new request');
  }

  Future<List<PlaceAutocompleteResult>> autocomplete(String query) async {
    if (_apiKey.isEmpty) {
      AppLogger.e('Google Maps API Key is missing in .env');
      throw Exception('API Key missing');
    }

    // Cancel any ongoing autocomplete request
    cancelPendingRequest();
    _cancelToken = CancelToken();

    _ensureSessionToken();

    try {
      final response = await _dio.post(
        'https://places.googleapis.com/v1/places:autocomplete',
        data: {
          'input': query,
          'sessionToken': _sessionToken,
        },
        options: Options(
          headers: {
            'X-Goog-Api-Key': _apiKey,
            'Content-Type': 'application/json',
          },
        ),
        cancelToken: _cancelToken,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final suggestions = data['suggestions'] as List<dynamic>? ?? [];
        return suggestions
            .map((p) => PlaceAutocompleteResult.fromJson(p as Map<String, dynamic>))
            .where((p) => p.placeId.isNotEmpty)
            .toList();
      } else {
        AppLogger.e('Places API Error: ${response.statusCode} - ${response.data}');
        throw Exception('Failed to fetch places: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        AppLogger.d('Autocomplete request cancelled');
        return []; // Return empty if cancelled, caller should ignore
      }
      AppLogger.e('DioException in autocomplete: ${e.message}\nGoogle Response: ${e.response?.data}');
      rethrow;
    }
  }

  Future<PlaceDetails> getPlaceDetails(String placeId) async {
    if (_apiKey.isEmpty) {
      throw Exception('API Key missing');
    }

    _ensureSessionToken();

    try {
      final response = await _dio.get(
        'https://places.googleapis.com/v1/places/$placeId',
        queryParameters: {
          'sessionToken': _sessionToken,
        },
        options: Options(
          headers: {
            'X-Goog-Api-Key': _apiKey,
            'X-Goog-FieldMask': 'id,displayName,formattedAddress,location',
          },
        ),
      );

      if (response.statusCode == 200) {
        clearSessionToken();
        return PlaceDetails.fromJson(response.data);
      } else {
        AppLogger.e('Place Details API Error: ${response.statusCode} - ${response.data}');
        throw Exception('Failed to fetch place details: ${response.statusCode}');
      }
    } on DioException catch (e) {
      AppLogger.e('DioException fetching place details: ${e.message}\nGoogle Response: ${e.response?.data}');
      rethrow;
    } catch (e) {
      AppLogger.e('Error fetching place details: $e');
      rethrow;
    }
  }
}
