import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'company_bucket_url.g.dart';

/// Manages the dynamic CDN/S3 bucket URL returned by the Company API.
/// It persists the value to [SharedPreferences] to ensure instant availability
/// on cold start and offline scenarios.
class CompanyBucketUrl {
  CompanyBucketUrl._();

  static const String storageKey = 'bucket_url';
  static const String _defaultBucketUrl = 'https://cdn.reachu.co.in';

  static String _current = _defaultBucketUrl;

  /// Returns the current active bucket URL.
  static String get current => _current;

  /// Initializes the bucket URL from local [SharedPreferences] cache on app startup.
  static Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedUrl = prefs.getString(storageKey);
      if (savedUrl != null && savedUrl.trim().isNotEmpty) {
        _current = savedUrl.trim();
      }
    } catch (e) {
      debugPrint('CompanyBucketUrl init error: $e');
    }
  }

  /// Updates the in-memory bucket URL and persists it to local storage.
  static Future<void> update(String? newUrl) async {
    if (newUrl == null || newUrl.trim().isEmpty) return;

    final trimmed = newUrl.trim();
    if (_current == trimmed) return;

    _current = trimmed;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(storageKey, trimmed);
    } catch (e) {
      debugPrint('CompanyBucketUrl update error: $e');
    }
  }

  /// Safely resolves a full image or file URL from a relative path or full URL.
  /// 
  /// Edge cases handled:
  /// - `null`, empty, or `'null'` strings -> returns `''`
  /// - Full URLs (`http://`, `https://`) -> returns as-is
  /// - Leading slashes `/path/image.png` -> properly joined without double slashes
  /// - Legacy bucket prefix `satyakabir-bucket/` -> stripped automatically
  static String getImageUrl(String? path) {
    if (path == null) {
      return '';
    }

    var cleanPath = path.trim();
    if (cleanPath.isEmpty || cleanPath == 'null' || cleanPath == 'undefined') {
      return '';
    }

    if (cleanPath.startsWith('http://') || cleanPath.startsWith('https://')) {
      return cleanPath;
    }

    if (cleanPath.startsWith('/')) {
      cleanPath = cleanPath.substring(1);
    }

    if (cleanPath.startsWith('satyakabir-bucket/')) {
      cleanPath = cleanPath.substring('satyakabir-bucket/'.length);
    }

    final base = _current.trim();
    if (base.isEmpty) {
      return cleanPath;
    }

    final cleanBase = base.endsWith('/') ? base : '$base/';
    return '$cleanBase$cleanPath';
  }

  @visibleForTesting
  static void setMockCurrent(String mockUrl) {
    _current = mockUrl;
  }

  @visibleForTesting
  static void reset() {
    _current = _defaultBucketUrl;
  }
}

@Riverpod(keepAlive: true)
String companyBucketUrl(Ref ref) {
  return CompanyBucketUrl.current;
}
