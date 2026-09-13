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
  const factory ActionRequiredItem({
    required String stepId,
    required String documentKey,
    String? rejectionReason,
  }) = _ActionRequiredItem;

  factory ActionRequiredItem.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    return ActionRequiredItem(
      stepId: map['stepId']?.toString() ?? '',
      documentKey: map['documentKey']?.toString() ?? '',
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
abstract class StepDetail with _$StepDetail {
  const factory StepDetail({
    required String status,
    required bool unlocked,
    String? submittedAt,
    String? verifiedAt,
    String? rejectionReason,
    Map<String, bool>? fieldCompletion,
    Map<String, DocumentDetail>? documents,
  }) = _StepDetail;

  factory StepDetail.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    final fieldCompMap = _toMap(map['fieldCompletion']);
    final docsMap = _toMap(map['documents']);

    return StepDetail(
      status: map['status']?.toString() ?? '',
      unlocked: map['unlocked'] == true,
      submittedAt: map['submittedAt']?.toString(),
      verifiedAt: map['verifiedAt']?.toString(),
      rejectionReason: map['rejectionReason']?.toString(),
      fieldCompletion: fieldCompMap?.map((k, v) => MapEntry(k, v == true)),
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
  }) = _PersonalInfoData;

  factory PersonalInfoData.fromJson(Map<String, dynamic> json) {
    final map = _toMap(json) ?? {};
    return PersonalInfoData(
      name: map['name']?.toString(),
      email: map['email']?.toString(),
      dateOfBirth: map['dateOfBirth']?.toString(),
      gender: map['gender']?.toString(),
    );
  }
}

@freezed
abstract class VehicleInfoData with _$VehicleInfoData {
  const factory VehicleInfoData({
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

