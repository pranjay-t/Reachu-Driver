import 'package:flutter_test/flutter_test.dart';
import 'package:reachu_driver/core/network/api_endpoints.dart';
import 'package:reachu_driver/core/network/company_bucket_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    CompanyBucketUrl.reset();
  });

  group('CompanyBucketUrl & ApiEndpoints.getImageUrl Tests', () {
    test('Default bucket URL is https://cdn.reachu.co.in', () {
      expect(CompanyBucketUrl.current, equals('https://cdn.reachu.co.in'));
      expect(ApiEndpoints.imagebaseUrl, equals('https://cdn.reachu.co.in'));
    });

    test('init() restores saved bucket URL from SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({
        CompanyBucketUrl.storageKey: 'https://cached.reachu.co.in',
      });

      await CompanyBucketUrl.init();

      expect(CompanyBucketUrl.current, equals('https://cached.reachu.co.in'));
      expect(ApiEndpoints.imagebaseUrl, equals('https://cached.reachu.co.in'));
    });

    test('update() modifies current URL and persists to SharedPreferences', () async {
      final prefs = await SharedPreferences.getInstance();

      await CompanyBucketUrl.update('https://new-cdn.reachu.co.in');

      expect(CompanyBucketUrl.current, equals('https://new-cdn.reachu.co.in'));
      expect(prefs.getString(CompanyBucketUrl.storageKey), equals('https://new-cdn.reachu.co.in'));
    });

    test('update() ignores null or empty strings', () async {
      await CompanyBucketUrl.update('https://valid.reachu.co.in');
      await CompanyBucketUrl.update(null);
      await CompanyBucketUrl.update('');
      await CompanyBucketUrl.update('   ');

      expect(CompanyBucketUrl.current, equals('https://valid.reachu.co.in'));
    });

    test('getImageUrl resolves relative paths with leading slash', () {
      expect(
        ApiEndpoints.getImageUrl('/GITA/logo-1785515890998.png'),
        equals('https://cdn.reachu.co.in/GITA/logo-1785515890998.png'),
      );
    });

    test('getImageUrl resolves relative paths without leading slash', () {
      expect(
        ApiEndpoints.getImageUrl('GITA/logo-1785515890998.png'),
        equals('https://cdn.reachu.co.in/GITA/logo-1785515890998.png'),
      );
    });

    test('getImageUrl preserves full http/https URLs', () {
      const httpsUrl = 'https://other-domain.com/images/car.png';
      const httpUrl = 'http://other-domain.com/images/car.png';

      expect(ApiEndpoints.getImageUrl(httpsUrl), equals(httpsUrl));
      expect(ApiEndpoints.getImageUrl(httpUrl), equals(httpUrl));
    });

    test('getImageUrl strips legacy satyakabir-bucket prefix', () {
      expect(
        ApiEndpoints.getImageUrl('satyakabir-bucket/GITA/logo.png'),
        equals('https://cdn.reachu.co.in/GITA/logo.png'),
      );
      expect(
        ApiEndpoints.getImageUrl('/satyakabir-bucket/GITA/logo.png'),
        equals('https://cdn.reachu.co.in/GITA/logo.png'),
      );
    });

    test('getImageUrl handles null, empty and string "null" safely', () {
      expect(ApiEndpoints.getImageUrl(null), equals(''));
      expect(ApiEndpoints.getImageUrl(''), equals(''));
      expect(ApiEndpoints.getImageUrl('null'), equals(''));
      expect(ApiEndpoints.getImageUrl('undefined'), equals(''));
      expect(ApiEndpoints.getImageUrl('   '), equals(''));
    });

    test('getImageUrl avoids double slashes when bucketUrl has trailing slash', () async {
      await CompanyBucketUrl.update('https://cdn.reachu.co.in/');
      expect(
        ApiEndpoints.getImageUrl('/GITA/logo.png'),
        equals('https://cdn.reachu.co.in/GITA/logo.png'),
      );
      expect(
        ApiEndpoints.getImageUrl('GITA/logo.png'),
        equals('https://cdn.reachu.co.in/GITA/logo.png'),
      );
    });
  });
}
