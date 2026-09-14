import 'package:flutter_test/flutter_test.dart';
import 'package:reachu_driver/features/auth/models/driver_registration_status_response.dart';
import 'package:reachu_driver/features/auth/models/onboarding_enums.dart';

void main() {
  group('DriverRegistrationStatusResponse Tests', () {
    test('Parses full json payload from GET /driver/registration/status correctly', () {
      final jsonMap = {
        "success": true,
        "data": {
          "registrationId": "6a648cd1bbbce35911757af0",
          "driverId": "6a63443e31355d339f0f9b11",
          "overallStatus": "action_required",
          "currentStepId": "driving_license",
          "nextStepId": "profile_photo",
          "completedStepIds": ["phone_verification", "personal_info"],
          "completedUiStepIds": ["phone_verification"],
          "onboardingComplete": false,
          "progress": {"completed": 1, "total": 5, "percentage": 20.0},
          "actionRequired": [
            {
              "stepId": "profile_photo",
              "documentKey": "profileImage",
              "rejectionReason": "Document has expired"
            }
          ],
          "personalInfo": {
            "dateOfBirth": "1990-01-15T00:00:00.000Z",
            "email": "driver@example.com",
            "gender": "Male",
            "name": "Test Driver"
          }
        },
        "message": "Registration status fetched successfully"
      };

      final response = DriverRegistrationStatusResponse.fromJson(jsonMap);

      expect(response.success, isTrue);
      expect(response.message, equals("Registration status fetched successfully"));
      expect(response.data, isNotNull);
      expect(response.data!.overallStatus, equals(OverallStatus.actionRequired));
      expect(response.data!.currentStepId, equals(RegistrationSteps.drivingLicense));
      expect(response.data!.nextStepId, equals(RegistrationSteps.profilePhoto));
      expect(response.data!.actionRequired.length, equals(1));
      expect(
        response.data!.actionRequired.first.rejectionReason,
        equals("Document has expired"),
      );
      expect(response.data!.personalInfo?.name, equals("Test Driver"));
      expect(response.data!.personalInfo?.email, equals("driver@example.com"));
    });

    test('Parses full server log payload with steps and vehicleInfo int values', () {
      final jsonMap = {
        "success": true,
        "data": {
          "registrationId": "6a648cd1bbbce35911757af0",
          "driverId": "6a63443e31355d339f0f9b11",
          "overallStatus": "pending_review",
          "currentStepId": "vehicle_details",
          "nextStepId": null,
          "completedStepIds": [
            "phone_verification",
            "personal_info",
            "profile_photo",
            "driving_license",
            "aadhar",
            "pan",
            "vehicle_details"
          ],
          "completedUiStepIds": [
            "phone_verification",
            "personal_details",
            "driving_license",
            "identity_documents",
            "vehicle_details",
            "vehicle_preference"
          ],
          "onboardingComplete": false,
          "progress": {"completed": 5, "total": 5, "percentage": 100},
          "uiSteps": {
            "phone_verification": {
              "label": "Phone Verification",
              "status": "verified",
              "unlocked": true,
              "optional": false,
              "stepIds": ["phone_verification"],
              "steps": {
                "phone_verification": {
                  "status": "verified",
                  "unlocked": true,
                  "submittedAt": null,
                  "verifiedAt": "2026-07-25T10:15:53.508Z",
                  "rejectionReason": null
                }
              }
            }
          },
          "steps": {
            "phone_verification": {
              "status": "verified",
              "unlocked": true,
              "submittedAt": null,
              "verifiedAt": "2026-07-25T10:15:53.508Z",
              "rejectionReason": null
            }
          },
          "actionRequired": [],
          "personalInfo": {
            "dateOfBirth": "1990-01-15T00:00:00.000Z",
            "email": "drivgthygy1r@example.com",
            "gender": "Male",
            "name": "Test Driver"
          },
          "kycInfo": {
            "dlNumber": "dl91cnjjdjd",
            "aadharNumber": 209395346170,
            "panNumber": "CINPT1914R"
          },
          "vehiclePreference": {"preference": "Self", "explicitPreference": "Self"},
          "vehicleInfo": {
            "vehicleCapacity": 4,
            "vehicleColor": "Red",
            "vehicleId": "6a64a851bbbce35911757d13",
            "vehicleModel": "Aww",
            "vehicleName": "Commercial Sedan",
            "vehicleNumber": "MH1234567",
            "vehicleSubType": "69b515d19f60009f44543764",
            "vehicleType": "6999ebeec98622be4c21e7b2",
            "vehicleYear": 2026
          },
          "submittedForReviewAt": "2026-07-25T12:13:24.696Z",
          "approvedAt": null
        },
        "message": "Registration status fetched successfully"
      };

      final response = DriverRegistrationStatusResponse.fromJson(jsonMap);
      expect(response.success, isTrue);
      expect(response.data!.vehicleInfo?.vehicleCapacity, equals("4"));
      expect(response.data!.vehicleInfo?.vehicleYear, equals("2026"));
    });

    test('Parses payload with untyped Map<dynamic, dynamic> from Dio response without throwing TypeError', () {
      final Map<dynamic, dynamic> untypedJsonMap = <dynamic, dynamic>{
        "success": true,
        "data": <dynamic, dynamic>{
          "registrationId": "6a648cd1bbbce35911757af0",
          "driverId": "6a63443e31355d339f0f9b11",
          "overallStatus": "pending_review",
          "currentStepId": "vehicle_details",
          "nextStepId": null,
          "completedStepIds": <dynamic>["phone_verification"],
          "completedUiStepIds": <dynamic>["phone_verification"],
          "onboardingComplete": false,
          "progress": <dynamic, dynamic>{"completed": 5, "total": 5, "percentage": 100},
          "uiSteps": <dynamic, dynamic>{
            "phone_verification": <dynamic, dynamic>{
              "label": "Phone Verification",
              "status": "verified",
              "unlocked": true,
              "optional": false,
              "stepIds": <dynamic>["phone_verification"],
              "steps": <dynamic, dynamic>{
                "phone_verification": <dynamic, dynamic>{
                  "status": "verified",
                  "unlocked": true,
                  "submittedAt": null,
                  "verifiedAt": "2026-07-25T10:15:53.508Z",
                  "rejectionReason": null
                }
              }
            }
          },
          "steps": <dynamic, dynamic>{
            "phone_verification": <dynamic, dynamic>{
              "status": "verified",
              "unlocked": true,
              "submittedAt": null,
              "verifiedAt": "2026-07-25T10:15:53.508Z",
              "rejectionReason": null
            }
          },
          "actionRequired": <dynamic>[],
          "personalInfo": <dynamic, dynamic>{
            "dateOfBirth": "1990-01-15T00:00:00.000Z",
            "email": "drivgthygy1r@example.com",
            "gender": "Male",
            "name": "Test Driver"
          },
          "kycInfo": <dynamic, dynamic>{
            "dlNumber": "dl91cnjjdjd",
            "aadharNumber": 209395346170,
            "panNumber": "CINPT1914R"
          },
          "vehiclePreference": <dynamic, dynamic>{"preference": "Self", "explicitPreference": "Self"},
          "vehicleInfo": <dynamic, dynamic>{
            "vehicleCapacity": 4,
            "vehicleColor": "Red",
            "vehicleYear": 2026
          },
          "submittedForReviewAt": "2026-07-25T12:13:24.696Z",
          "approvedAt": null
        },
        "message": "Registration status fetched successfully"
      };

      final response = DriverRegistrationStatusResponse.fromJson(Map<String, dynamic>.from(untypedJsonMap));
      expect(response.success, isTrue);
    });

    test('Parses field-level rejections in actionRequired correctly', () {
      final jsonMap = {
        "success": true,
        "data": {
          "overallStatus": "action_required",
          "actionRequired": [
            {
              "kind": "field",
              "stepId": "vehicle_details",
              "documentKey": null,
              "fieldKey": "vehicleNumber",
              "label": "Vehicle Number",
              "rejectionReason": "Does not match the government vehicle record (VAHAN)"
            },
            {
              "kind": "field",
              "stepId": "vehicle_details",
              "documentKey": null,
              "fieldKey": "vehicleType",
              "label": "Vehicle Category",
              "rejectionReason": "Does not match the uploaded documents"
            },
            {
              "kind": "field",
              "stepId": "vehicle_details",
              "documentKey": null,
              "fieldKey": "vehicleSubType",
              "label": "Vehicle Sub-category",
              "rejectionReason": "Does not match the uploaded documents"
            }
          ]
        },
        "message": "Registration status fetched successfully"
      };

      final response = DriverRegistrationStatusResponse.fromJson(jsonMap);
      expect(response.success, isTrue);
      expect(response.data?.actionRequired.length, equals(3));
      final first = response.data!.actionRequired.first;
      expect(first.isField, isTrue);
      expect(first.isDocument, isFalse);
      expect(first.fieldKey, equals('vehicleNumber'));
      expect(first.label, equals('Vehicle Number'));
      expect(first.rejectionReason, equals('Does not match the government vehicle record (VAHAN)'));
    });

    test('Parses real-world payload with rejected vehicle fields and previous values', () {
      final jsonMap = {
        "success": true,
        "data": {
          "registrationId": "6aa82495636b6d4f87b0d308",
          "driverId": "6aa82495636b6d4f87b0d305",
          "overallStatus": "action_required",
          "currentStepId": "vehicle_details",
          "steps": {
            "vehicle_details": {
              "status": "rejected",
              "unlocked": true,
              "fields": {
                "vehicleNumber": {
                  "label": "Vehicle Number",
                  "type": "text",
                  "value": "Mgg363637",
                  "displayValue": "Mgg363637",
                  "status": "rejected",
                  "rejectionReason": "Does not match the government vehicle record (VAHAN)",
                },
                "vehicleType": {
                  "label": "Vehicle Category",
                  "type": "reference",
                  "value": "6999ebeec98622be4c21e7b2",
                  "displayValue": "Truck",
                  "status": "rejected",
                  "rejectionReason": "Does not match the uploaded documents",
                },
                "vehicleSubType": {
                  "label": "Vehicle Sub-category",
                  "type": "reference",
                  "value": "69b515d19f60009f44543764",
                  "displayValue": "Tata ACE (750kg)",
                  "status": "rejected",
                  "rejectionReason": "Does not match the uploaded documents",
                }
              }
            }
          },
          "actionRequired": [
            {
              "kind": "field",
              "stepId": "vehicle_details",
              "documentKey": null,
              "fieldKey": "vehicleNumber",
              "label": "Vehicle Number",
              "rejectionReason": "Does not match the government vehicle record (VAHAN)"
            },
            {
              "kind": "field",
              "stepId": "vehicle_details",
              "documentKey": null,
              "fieldKey": "vehicleType",
              "label": "Vehicle Category",
              "rejectionReason": "Does not match the uploaded documents"
            },
            {
              "kind": "field",
              "stepId": "vehicle_details",
              "documentKey": null,
              "fieldKey": "vehicleSubType",
              "label": "Vehicle Sub-category",
              "rejectionReason": "Does not match the uploaded documents"
            }
          ],
          "personalInfo": {
            "homeCityId": "69aaae4a56e8f5ff7a8b5fbb",
            "homeCityName": "Bhopal",
            "dateOfBirth": "2003-03-13T00:00:00.000Z",
            "email": "pranjayt90@gmail.com",
            "gender": "Male",
            "name": "Pranjay Driver"
          },
          "vehicleInfo": {
            "vehicleCapacity": 4,
            "vehicleColor": "black",
            "vehicleId": "6aa82c205206540c4d37b3fd",
            "vehicleModel": "kvig",
            "vehicleName": "Ace",
            "vehicleNumber": "Mgg363637",
            "vehicleSubType": "69b515d19f60009f44543764",
            "vehicleType": "6999ebeec98622be4c21e7b2",
            "vehicleYear": 2020
          }
        },
        "message": "Registration status fetched successfully"
      };

      final response = DriverRegistrationStatusResponse.fromJson(jsonMap);
      expect(response.success, isTrue);
      expect(response.data!.actionRequired.length, equals(3));
      final vehicleStep = response.data!.steps?['vehicle_details'];
      expect(vehicleStep, isNotNull);
      expect(vehicleStep!.fields?['vehicleNumber']?.value, equals("Mgg363637"));
      expect(vehicleStep.fields?['vehicleType']?.displayValue, equals("Truck"));
      expect(vehicleStep.fields?['vehicleSubType']?.displayValue, equals("Tata ACE (750kg)"));
      expect(response.data!.personalInfo?.homeCityName, equals("Bhopal"));
      expect(response.data!.vehicleInfo?.vehicleNumber, equals("Mgg363637"));
    });
  });
}
