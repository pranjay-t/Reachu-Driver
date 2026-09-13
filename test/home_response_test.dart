import 'package:flutter_test/flutter_test.dart';
import 'package:reachu_driver/features/home/models/home_response.dart';

void main() {
  group('HomeResponse Parsing Tests', () {
    test('Parses GET /driver/home response cleanly without throwing TypeError', () {
      final json = {
        "success": true,
        "message": "Driver home data fetched successfully",
        "data": {
          "driver": {
            "id": "6a63443e31355d339f0f9b11",
            "name": "Test Driver",
            "image": "CorequestCabBooking/profileImage-1784979600156.jpg",
            "isOnline": false,
            "onboardingComplete": true,
            "willGetOrder": true
          },
          "documentSubmission": {
            "isPending": false,
            "registration": {
              "registrationId": "6a648cd1bbbce35911757af0",
              "overallStatus": "approved"
            }
          },
          "todayStats": {
            "earnings": {"total": 0, "cash": 0, "online": 0},
            "rides": {"total": 0, "completed": 0, "cancelled": 0}
          }
        }
      };

      final response = HomeResponse.fromJson(json);

      expect(response.success, isTrue);
      expect(response.data.driver.name, equals('Test Driver'));
      expect(response.data.driver.verificationStatus, isNull);
      expect(response.data.driver.isOnline, isFalse);
      expect(response.data.todayStats.earnings.total, equals(0.0));
      expect(response.data.todayStats.rides.total, equals(0));
    });
  });
}
