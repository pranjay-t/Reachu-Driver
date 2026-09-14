// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_registration_status_response.freezed.dart';

Map<String, dynamic>? _toMap(dynamic val) {
  if (val == null) return null;
  if (val is Map<String, dynamic>) return val;
  if (val is Map) {
    return val.map((k, v) => MapEntry(k.toString(), v));
  }
  return null;
}

List<dynamic>? _toList(dynamic val) {
  if (val == null) return null;
  if (val is List) return val;
  return null;
}

@freezed
abstract class ProgressInfo with _$ProgressInfo {
  const factory ProgressInfo({
    int? completed,
    int? total,
    double? percentage,
  }) = _ProgressInfo;

  factory ProgressInfo.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    return ProgressInfo(
      completed: (map['completed'] as num?)?.toInt(),
      total: (map['total'] as num?)?.toInt(),
      percentage: (map['percentage'] as num?)?.toDouble(),
    );
  }
}

@freezed
abstract class ActionRequiredItem with _$ActionRequiredItem {
  const ActionRequiredItem._();

  const factory ActionRequiredItem({
    required String stepId,
    String? kind,
    String? documentKey,
    String? fieldKey,
    String? label,
    String? rejectionReason,
  }) = _ActionRequiredItem;

  bool get isField =>
      kind == 'field' || (fieldKey != null && fieldKey!.isNotEmpty);
  bool get isDocument =>
      kind == 'document' || (documentKey != null && documentKey!.isNotEmpty && fieldKey == null);
  String get itemKey =>
      isField ? '${stepId}_field_$fieldKey' : '${stepId}_doc_$documentKey';

  String get displayLabel {
    if (label != null && label!.trim().isNotEmpty) {
      return label!;
    }
    final rawKey = isField ? (fieldKey ?? '') : (documentKey ?? '');
    switch (rawKey) {
      case 'profileImage':
        return 'Profile Photo';
      case 'dlImage':
        return 'Driving License Photo';
      case 'dlNumber':
        return 'Driving License Number';
      case 'aadharFront':
        return 'Aadhar Front Photo';
      case 'aadharBack':
        return 'Aadhar Back Photo';
      case 'aadharNumber':
        return 'Aadhar Number';
      case 'panImage':
        return 'PAN Card Photo';
      case 'panNumber':
        return 'PAN Card Number';
      case 'vehicleImage':
        return 'Vehicle Photo';
      case 'vehicleNumberImage':
        return 'Vehicle Number Plate Photo';
      case 'rcImage':
        return 'RC Document Photo';
      case 'vehicleInsuranceImage':
        return 'Vehicle Insurance Photo';
      case 'vehicleNumber':
        return 'Vehicle Number';
      case 'vehicleType':
        return 'Vehicle Category';
      case 'vehicleSubType':
        return 'Vehicle Sub-Category';
      case 'vehicleName':
        return 'Vehicle Name';
      case 'vehicleColor':
        return 'Vehicle Color';
      case 'vehicleModel':
        return 'Vehicle Model';
      case 'vehicleYear':
        return 'Manufacture Year';
      case 'vehicleCapacity':
        return 'Seating Capacity';
      case 'dateOfBirth':
        return 'Date of Birth';
      case 'cityId':
      case 'city':
        return 'Service City';
      case 'name':
        return 'Full Name';
      default:
        final cleaned = rawKey.replaceAll(RegExp(r'Image$|Photo$'), '');
        final formatted = cleaned.replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (match) => '${match.group(1)} ${match.group(2)}',
        );
        if (formatted.isEmpty) return rawKey;
        return formatted.split(' ').map((word) {
          if (word.isEmpty) return '';
          return word[0].toUpperCase() + word.substring(1);
        }).join(' ');
    }
  }

  factory ActionRequiredItem.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    final kind = map['kind']?.toString() ??
        (map['fieldKey'] != null ? 'field' : (map['documentKey'] != null ? 'document' : 'field'));
    return ActionRequiredItem(
      stepId: map['stepId']?.toString() ?? '',
      kind: kind,
      documentKey: map['documentKey']?.toString(),
      fieldKey: map['fieldKey']?.toString(),
      label: map['label']?.toString(),
      rejectionReason: map['rejectionReason']?.toString(),
    );
  }
}

@freezed
abstract class DocumentDetail with _$DocumentDetail {
  const factory DocumentDetail({
    String? fileKey,
    required String status,
    String? rejectionReason,
    String? rejectedAt,
    String? submittedAt,
    String? verifiedAt,
    int? resubmissionCount,
  }) = _DocumentDetail;

  factory DocumentDetail.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    return DocumentDetail(
      fileKey: map['fileKey']?.toString(),
      status: map['status']?.toString() ?? 'pending',
      rejectionReason: map['rejectionReason']?.toString(),
      rejectedAt: map['rejectedAt']?.toString(),
      submittedAt: map['submittedAt']?.toString(),
      verifiedAt: map['verifiedAt']?.toString(),
      resubmissionCount: (map['resubmissionCount'] as num?)?.toInt(),
    );
  }
}

@freezed
abstract class FieldDetail with _$FieldDetail {
  const factory FieldDetail({
    String? label,
    String? type,
    dynamic value,
    String? displayValue,
    String? status,
    String? rejectionReason,
    String? rejectedAt,
    String? verifiedAt,
    dynamic reviewedValue,
    int? resubmissionCount,
  }) = _FieldDetail;

  factory FieldDetail.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    return FieldDetail(
      label: map['label']?.toString(),
      type: map['type']?.toString(),
      value: map['value'],
      displayValue: map['displayValue']?.toString() ?? map['value']?.toString(),
      status: map['status']?.toString() ?? 'draft',
      rejectionReason: map['rejectionReason']?.toString(),
      rejectedAt: map['rejectedAt']?.toString(),
      verifiedAt: map['verifiedAt']?.toString(),
      reviewedValue: map['reviewedValue'],
      resubmissionCount: (map['resubmissionCount'] as num?)?.toInt(),
    );
  }
}

@freezed
abstract class StepDetail with _$StepDetail {
  const factory StepDetail({
    required String status,
    required bool unlocked,
    String? submittedAt,
    String? verifiedAt,
    String? rejectionReason,
    Map<String, bool>? fieldCompletion,
    Map<String, FieldDetail>? fields,
    Map<String, DocumentDetail>? documents,
  }) = _StepDetail;

  factory StepDetail.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    final fieldCompMap = _toMap(map['fieldCompletion']);
    final fieldsMap = _toMap(map['fields']);
    final docsMap = _toMap(map['documents']);

    return StepDetail(
      status: map['status']?.toString() ?? '',
      unlocked: map['unlocked'] == true,
      submittedAt: map['submittedAt']?.toString(),
      verifiedAt: map['verifiedAt']?.toString(),
      rejectionReason: map['rejectionReason']?.toString(),
      fieldCompletion: fieldCompMap?.map((k, v) => MapEntry(k, v == true)),
      fields: fieldsMap?.map(
        (k, v) {
          final fMap = _toMap(v);
          return MapEntry(
            k,
            fMap != null ? FieldDetail.fromJson(fMap) : const FieldDetail(),
          );
        },
      ),
      documents: docsMap?.map(
        (k, v) {
          final docMap = _toMap(v);
          return MapEntry(
            k,
            docMap != null ? DocumentDetail.fromJson(docMap) : const DocumentDetail(status: 'pending'),
          );
        },
      ),
    );
  }
}

@freezed
abstract class UiStepGroup with _$UiStepGroup {
  const factory UiStepGroup({
    required String label,
    required String status,
    required bool unlocked,
    required bool optional,
    required List<String> stepIds,
    Map<String, StepDetail>? steps,
  }) = _UiStepGroup;

  factory UiStepGroup.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    final stepsMap = _toMap(map['steps']);
    final stepIdsList = _toList(map['stepIds']);

    return UiStepGroup(
      label: map['label']?.toString() ?? '',
      status: map['status']?.toString() ?? '',
      unlocked: map['unlocked'] == true,
      optional: map['optional'] == true,
      stepIds: stepIdsList?.map((e) => e.toString()).toList() ?? [],
      steps: stepsMap?.map(
        (k, v) {
          final stepMap = _toMap(v);
          return MapEntry(
            k,
            stepMap != null
                ? StepDetail.fromJson(stepMap)
                : const StepDetail(status: '', unlocked: false),
          );
        },
      ),
    );
  }
}

@freezed
abstract class PersonalInfoData with _$PersonalInfoData {
  const factory PersonalInfoData({
    String? name,
    String? email,
    String? dateOfBirth,
    String? gender,
    String? cityId,
    String? homeCityId,
    String? homeCityName,
  }) = _PersonalInfoData;

  factory PersonalInfoData.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    final cId = map['cityId']?.toString() ??
        map['homeCityId']?.toString() ??
        (map['city'] is Map ? map['city']['_id']?.toString() : map['city']?.toString());
    return PersonalInfoData(
      name: map['name']?.toString(),
      email: map['email']?.toString(),
      dateOfBirth: map['dateOfBirth']?.toString(),
      gender: map['gender']?.toString(),
      cityId: cId,
      homeCityId: map['homeCityId']?.toString() ?? cId,
      homeCityName: map['homeCityName']?.toString() ??
          (map['city'] is Map ? map['city']['name']?.toString() : null),
    );
  }
}

@freezed
abstract class VehicleInfoData with _$VehicleInfoData {
  const factory VehicleInfoData({
    String? vehicleId,
    String? vehicleName,
    String? vehicleNumber,
    String? vehicleColor,
    String? vehicleModel,
    String? vehicleYear,
    String? vehicleCapacity,
    String? vehicleType,
    String? vehicleSubType,
  }) = _VehicleInfoData;

  factory VehicleInfoData.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    return VehicleInfoData(
      vehicleId: map['vehicleId']?.toString() ?? map['_id']?.toString(),
      vehicleName: map['vehicleName']?.toString(),
      vehicleNumber: map['vehicleNumber']?.toString(),
      vehicleColor: map['vehicleColor']?.toString(),
      vehicleModel: map['vehicleModel']?.toString(),
      vehicleYear: map['vehicleYear']?.toString(),
      vehicleCapacity: map['vehicleCapacity']?.toString(),
      vehicleType: map['vehicleType']?.toString(),
      vehicleSubType: map['vehicleSubType']?.toString(),
    );
  }
}

@freezed
abstract class RegistrationStatusData with _$RegistrationStatusData {
  const factory RegistrationStatusData({
    String? registrationId,
    String? driverId,
    required String overallStatus,
    String? currentStepId,
    String? nextStepId,
    @Default([]) List<String> completedStepIds,
    @Default([]) List<String> completedUiStepIds,
    @Default(false) bool onboardingComplete,
    ProgressInfo? progress,
    Map<String, UiStepGroup>? uiSteps,
    Map<String, StepDetail>? steps,
    @Default([]) List<ActionRequiredItem> actionRequired,
    PersonalInfoData? personalInfo,
    VehicleInfoData? vehicleInfo,
    Map<String, dynamic>? kycInfo,
    String? submittedForReviewAt,
    String? approvedAt,
  }) = _RegistrationStatusData;

  factory RegistrationStatusData.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    final uiStepsMap = _toMap(map['uiSteps']);
    final stepsMap = _toMap(map['steps']);
    final progressMap = _toMap(map['progress']);
    final personalInfoMap = _toMap(map['personalInfo']);
    final vehicleInfoMap = _toMap(map['vehicleInfo']);
    final kycInfoMap = _toMap(map['kycInfo']);
    final actionReqList = _toList(map['actionRequired']);
    final completedStepList = _toList(map['completedStepIds']);
    final completedUiStepList = _toList(map['completedUiStepIds']);

    return RegistrationStatusData(
      registrationId: map['registrationId']?.toString(),
      driverId: map['driverId']?.toString(),
      overallStatus: map['overallStatus']?.toString() ?? 'not_started',
      currentStepId: map['currentStepId']?.toString(),
      nextStepId: map['nextStepId']?.toString(),
      completedStepIds: completedStepList?.map((e) => e.toString()).toList() ?? [],
      completedUiStepIds: completedUiStepList?.map((e) => e.toString()).toList() ?? [],
      onboardingComplete: map['onboardingComplete'] == true,
      progress: progressMap != null ? ProgressInfo.fromJson(progressMap) : null,
      uiSteps: uiStepsMap?.map(
        (k, v) {
          final groupMap = _toMap(v);
          return MapEntry(
            k,
            groupMap != null
                ? UiStepGroup.fromJson(groupMap)
                : const UiStepGroup(
                    label: '',
                    status: '',
                    unlocked: false,
                    optional: false,
                    stepIds: [],
                  ),
          );
        },
      ),
      steps: stepsMap?.map(
        (k, v) {
          final stepMap = _toMap(v);
          return MapEntry(
            k,
            stepMap != null
                ? StepDetail.fromJson(stepMap)
                : const StepDetail(status: '', unlocked: false),
          );
        },
      ),
      actionRequired: actionReqList
              ?.map((e) {
                final itemMap = _toMap(e);
                return itemMap != null ? ActionRequiredItem.fromJson(itemMap) : null;
              })
              .whereType<ActionRequiredItem>()
              .toList() ??
          [],
      personalInfo: personalInfoMap != null ? PersonalInfoData.fromJson(personalInfoMap) : null,
      vehicleInfo: vehicleInfoMap != null ? VehicleInfoData.fromJson(vehicleInfoMap) : null,
      kycInfo: kycInfoMap,
      submittedForReviewAt: map['submittedForReviewAt']?.toString(),
      approvedAt: map['approvedAt']?.toString(),
    );
  }
}

@freezed
abstract class DriverRegistrationStatusResponse with _$DriverRegistrationStatusResponse {
  const factory DriverRegistrationStatusResponse({
    required bool success,
    required String message,
    RegistrationStatusData? data,
  }) = _DriverRegistrationStatusResponse;

  factory DriverRegistrationStatusResponse.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    final dataMap = _toMap(map['data']);
    return DriverRegistrationStatusResponse(
      success: map['success'] == true,
      message: map['message']?.toString() ?? '',
      data: dataMap != null ? RegistrationStatusData.fromJson(dataMap) : null,
    );
  }
}

