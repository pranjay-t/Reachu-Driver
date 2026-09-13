import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/driver_registration_status_response.dart';
import '../models/onboarding_enums.dart';
import '../models/vehicle_category.dart';
import '../repositories/auth_repository.dart';
import '../../../core/network/result.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../core/utils/app_logger.dart';
import 'auth_state_provider.dart';

part 'driver_onboarding_controller.g.dart';

class DriverOnboardingState {
  final RegistrationStatusData? statusData;
  final bool isLoading;
  final bool isStatusLoaded;
  final String? errorMessage;

  // Active Navigation in Onboarding
  final int activeGroupIndex; // 0: Personal Details, 1: Driving License, 2: Identity Docs, 3: Vehicle Details
  final int activeSubStepIndex; // Sub-step inside group

  // Categories for Step 4
  final List<VehicleCategory> categories;
  final List<VehicleSubCategory> subCategories;
  final String? selectedCategoryId;
  final String? selectedSubCategoryId;

  // Form Fields
  final String name;
  final String email;
  final String dateOfBirth;
  final String gender;
  final String dlNumber;
  final String aadharNumber;
  final String panNumber;

  final String vehicleName;
  final String vehicleNumber;
  final String vehicleColor;
  final String vehicleModel;
  final String vehicleYear;
  final String vehicleCapacity;

  // Uploaded File Paths
  final String? profileImage;
  final String? dlImage;
  final String? aadharFront;
  final String? aadharBack;
  final String? panImage;
  final String? vehicleImage;
  final String? vehicleNumberImage;
  final String? rcImage;
  final String? vehicleInsuranceImage;
  final Map<String, String> extraVehicleDocuments;

  DriverOnboardingState({
    this.statusData,
    this.isLoading = false,
    this.isStatusLoaded = false,
    this.errorMessage,
    this.activeGroupIndex = 0,
    this.activeSubStepIndex = 0,
    this.categories = const [],
    this.subCategories = const [],
    this.selectedCategoryId,
    this.selectedSubCategoryId,
    this.name = '',
    this.email = '',
    this.dateOfBirth = '',
    this.gender = 'Male',
    this.dlNumber = '',
    this.aadharNumber = '',
    this.panNumber = '',
    this.vehicleName = '',
    this.vehicleNumber = '',
    this.vehicleColor = '',
    this.vehicleModel = '',
    this.vehicleYear = '',
    this.vehicleCapacity = '',
    this.profileImage,
    this.dlImage,
    this.aadharFront,
    this.aadharBack,
    this.panImage,
    this.vehicleImage,
    this.vehicleNumberImage,
    this.rcImage,
    this.vehicleInsuranceImage,
    this.extraVehicleDocuments = const {},
  });

  DriverOnboardingState copyWith({
    RegistrationStatusData? statusData,
    bool? isLoading,
    bool? isStatusLoaded,
    String? errorMessage,
    int? activeGroupIndex,
    int? activeSubStepIndex,
    List<VehicleCategory>? categories,
    List<VehicleSubCategory>? subCategories,
    String? selectedCategoryId,
    String? selectedSubCategoryId,
    String? name,
    String? email,
    String? dateOfBirth,
    String? gender,
    String? dlNumber,
    String? aadharNumber,
    String? panNumber,
    String? vehicleName,
    String? vehicleNumber,
    String? vehicleColor,
    String? vehicleModel,
    String? vehicleYear,
    String? vehicleCapacity,
    String? profileImage,
    String? dlImage,
    String? aadharFront,
    String? aadharBack,
    String? panImage,
    String? vehicleImage,
    String? vehicleNumberImage,
    String? rcImage,
    String? vehicleInsuranceImage,
    Map<String, String>? extraVehicleDocuments,
  }) {
    return DriverOnboardingState(
      statusData: statusData ?? this.statusData,
      isLoading: isLoading ?? this.isLoading,
      isStatusLoaded: isStatusLoaded ?? this.isStatusLoaded,
      errorMessage: errorMessage,
      activeGroupIndex: activeGroupIndex ?? this.activeGroupIndex,
      activeSubStepIndex: activeSubStepIndex ?? this.activeSubStepIndex,
      categories: categories ?? this.categories,
      subCategories: subCategories ?? this.subCategories,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedSubCategoryId: selectedSubCategoryId ?? this.selectedSubCategoryId,
      name: name ?? this.name,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      dlNumber: dlNumber ?? this.dlNumber,
      aadharNumber: aadharNumber ?? this.aadharNumber,
      panNumber: panNumber ?? this.panNumber,
      vehicleName: vehicleName ?? this.vehicleName,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      vehicleColor: vehicleColor ?? this.vehicleColor,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      vehicleYear: vehicleYear ?? this.vehicleYear,
      vehicleCapacity: vehicleCapacity ?? this.vehicleCapacity,
      profileImage: profileImage ?? this.profileImage,
      dlImage: dlImage ?? this.dlImage,
      aadharFront: aadharFront ?? this.aadharFront,
      aadharBack: aadharBack ?? this.aadharBack,
      panImage: panImage ?? this.panImage,
      vehicleImage: vehicleImage ?? this.vehicleImage,
      vehicleNumberImage: vehicleNumberImage ?? this.vehicleNumberImage,
      rcImage: rcImage ?? this.rcImage,
      vehicleInsuranceImage: vehicleInsuranceImage ?? this.vehicleInsuranceImage,
      extraVehicleDocuments: extraVehicleDocuments ?? this.extraVehicleDocuments,
    );
  }
}

@riverpod
class DriverOnboardingController extends _$DriverOnboardingController {
  @override
  DriverOnboardingState build() {
    AppLogger.d('DriverOnboardingController build() called');
    Future.microtask(() async {
      await fetchRegistrationStatus();
      await loadCategories();
    });
    return DriverOnboardingState();
  }

  Future<void> fetchRegistrationStatus() async {
    state = state.copyWith(isLoading: true);
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.getRegistrationStatus();
    switch (result) {
      case Success(:final data):
        if (data.success && data.data != null) {
          final statusData = data.data!;
          int groupIndex = _determineGroupIndex(statusData);

          // Populate existing fields if backend provided them
          String name = state.name;
          String email = state.email;
          String dob = state.dateOfBirth;
          String gender = state.gender;
          if (statusData.personalInfo != null) {
            name = statusData.personalInfo!.name ?? name;
            email = statusData.personalInfo!.email ?? email;
            dob = statusData.personalInfo!.dateOfBirth ?? dob;
            gender = statusData.personalInfo!.gender ?? gender;
          }

          state = state.copyWith(
            isLoading: false,
            isStatusLoaded: true,
            statusData: statusData,
            activeGroupIndex: groupIndex,
            name: name,
            email: email,
            dateOfBirth: dob,
            gender: gender,
          );

          // Check overall status to update global AuthStatus
          if (statusData.overallStatus == OverallStatus.approved) {
            ref.read(authProvider.notifier).setAuthenticated();
          } else if (statusData.overallStatus == OverallStatus.actionRequired ||
              statusData.overallStatus == OverallStatus.pendingReview) {
            ref.read(authProvider.notifier).setPendingVerification();
          }
        } else {
          state = state.copyWith(isLoading: false, isStatusLoaded: true);
        }
      case Failure(:final error):
        AppLogger.e('Failed to fetch registration status', error: error);
        state = state.copyWith(
          isLoading: false,
          isStatusLoaded: true,
          errorMessage: 'Could not fetch registration status',
        );
    }
  }

  int _determineGroupIndex(RegistrationStatusData statusData) {
    final stepId = statusData.currentStepId ?? statusData.nextStepId ?? '';
    switch (stepId) {
      case RegistrationSteps.personalInfo:
      case RegistrationSteps.profilePhoto:
        return 0;
      case RegistrationSteps.drivingLicense:
        return 1;
      case RegistrationSteps.aadhar:
      case RegistrationSteps.pan:
        return 2;
      case RegistrationSteps.vehicleDetails:
        return 3;
      default:
        return 0;
    }
  }

  Future<void> loadCategories() async {
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.getVehicleCategories();
    switch (result) {
      case Success(:final data):
        state = state.copyWith(categories: data.data);
      case Failure():
        break;
    }
  }

  Future<void> loadSubCategories(String categoryId) async {
    state = state.copyWith(
      selectedCategoryId: categoryId,
      selectedSubCategoryId: null,
      subCategories: [],
    );
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.getVehicleSubCategories(categoryId);
    switch (result) {
      case Success(:final data):
        state = state.copyWith(subCategories: data.data);
      case Failure():
        break;
    }
  }

  void selectSubCategory(String subCategoryId) {
    state = state.copyWith(selectedSubCategoryId: subCategoryId);
  }

  void setDocument(String docType, String filePath) {
    switch (docType) {
      case 'profileImage':
        state = state.copyWith(profileImage: filePath);
        break;
      case 'dlImage':
        state = state.copyWith(dlImage: filePath);
        break;
      case 'aadharFront':
        state = state.copyWith(aadharFront: filePath);
        break;
      case 'aadharBack':
        state = state.copyWith(aadharBack: filePath);
        break;
      case 'panImage':
        state = state.copyWith(panImage: filePath);
        break;
      case 'vehicleImage':
        state = state.copyWith(vehicleImage: filePath);
        break;
      case 'vehicleNumberImage':
        state = state.copyWith(vehicleNumberImage: filePath);
        break;
      case 'rcImage':
        state = state.copyWith(rcImage: filePath);
        break;
      case 'vehicleInsuranceImage':
        state = state.copyWith(vehicleInsuranceImage: filePath);
        break;
      default:
        final updatedExtra = Map<String, String>.from(state.extraVehicleDocuments);
        updatedExtra[docType] = filePath;
        state = state.copyWith(extraVehicleDocuments: updatedExtra);
        break;
    }
  }

  void setActiveGroup(int groupIndex, {int subStepIndex = 0}) {
    state = state.copyWith(
      activeGroupIndex: groupIndex,
      activeSubStepIndex: subStepIndex,
    );
  }

  void setSubStep(int subStepIndex) {
    state = state.copyWith(activeSubStepIndex: subStepIndex);
  }

  // --- STEP 1: PERSONAL DETAILS ---
  Future<bool> submitStep1PersonalInfo({
    required String name,
    required String email,
    required String dateOfBirth,
    required String gender,
  }) async {
    state = state.copyWith(
      isLoading: true,
      name: name,
      email: email,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.submitPersonalInfo(
      name: name,
      email: email,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );

    switch (result) {
      case Success():
        state = state.copyWith(isLoading: false, activeSubStepIndex: 1);
        await fetchRegistrationStatus();
        return true;
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        AppSnackbar.showError(message: NetworkExceptions.getErrorMessage(error));
        return false;
    }
  }

  Future<bool> submitStep1ProfilePhoto(String filePath) async {
    state = state.copyWith(isLoading: true, profileImage: filePath);
    final repository = ref.read(authRepositoryProvider);
    final formData = FormData.fromMap({
      'profileImage': await MultipartFile.fromFile(filePath),
    });

    final result = await repository.submitProfilePhoto(formData);
    switch (result) {
      case Success():
        state = state.copyWith(isLoading: false, activeGroupIndex: 1, activeSubStepIndex: 0);
        await fetchRegistrationStatus();
        return true;
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        AppSnackbar.showError(message: NetworkExceptions.getErrorMessage(error));
        return false;
    }
  }

  // --- STEP 2: DRIVING LICENSE ---
  Future<bool> submitStep2DrivingLicense({
    required String dlNumber,
    required String dlImagePath,
  }) async {
    state = state.copyWith(isLoading: true, dlNumber: dlNumber, dlImage: dlImagePath);
    final repository = ref.read(authRepositoryProvider);
    final formData = FormData.fromMap({
      'dlNumber': dlNumber,
      'dlImage': await MultipartFile.fromFile(dlImagePath),
    });

    final result = await repository.submitDrivingLicense(formData);
    switch (result) {
      case Success():
        state = state.copyWith(isLoading: false, activeGroupIndex: 2, activeSubStepIndex: 0);
        await fetchRegistrationStatus();
        return true;
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        AppSnackbar.showError(message: NetworkExceptions.getErrorMessage(error));
        return false;
    }
  }

  // --- STEP 3: IDENTITY DOCUMENTS ---
  Future<bool> submitStep3Aadhar({
    required String aadharNumber,
    required String frontPath,
    required String backPath,
  }) async {
    state = state.copyWith(
      isLoading: true,
      aadharNumber: aadharNumber,
      aadharFront: frontPath,
      aadharBack: backPath,
    );
    final repository = ref.read(authRepositoryProvider);
    final formData = FormData.fromMap({
      'aadharNumber': aadharNumber,
      'aadharFront': await MultipartFile.fromFile(frontPath),
      'aadharBack': await MultipartFile.fromFile(backPath),
    });

    final result = await repository.submitAadhar(formData);
    switch (result) {
      case Success():
        state = state.copyWith(isLoading: false, activeSubStepIndex: 1);
        await fetchRegistrationStatus();
        return true;
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        AppSnackbar.showError(message: NetworkExceptions.getErrorMessage(error));
        return false;
    }
  }

  Future<bool> submitStep3Pan({
    required String panNumber,
    required String panImagePath,
  }) async {
    state = state.copyWith(isLoading: true, panNumber: panNumber, panImage: panImagePath);
    final repository = ref.read(authRepositoryProvider);
    final formData = FormData.fromMap({
      'panNumber': panNumber,
      'panImage': await MultipartFile.fromFile(panImagePath),
    });

    final result = await repository.submitPan(formData);
    switch (result) {
      case Success():
        state = state.copyWith(isLoading: false, activeGroupIndex: 3, activeSubStepIndex: 0);
        await fetchRegistrationStatus();
        return true;
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        AppSnackbar.showError(message: NetworkExceptions.getErrorMessage(error));
        return false;
    }
  }

  // --- STEP 4: VEHICLE DETAILS ---
  Future<bool> submitStep4VehicleDetails({
    required String vehicleName,
    required String vehicleNumber,
    required String vehicleColor,
    required String vehicleModel,
    required String vehicleYear,
    required String vehicleCapacity,
    required String vehicleType,
    required String vehicleSubType,
    required String vehicleImagePath,
    required String vehicleNumberImagePath,
    required String rcImagePath,
    required String vehicleInsuranceImagePath,
  }) async {
    state = state.copyWith(isLoading: true);
    final repository = ref.read(authRepositoryProvider);

    try {
      final Map<String, dynamic> formMap = {
        'vehicleName': vehicleName,
        'vehicleNumber': vehicleNumber,
        'vehicleColor': vehicleColor,
        'vehicleModel': vehicleModel,
        'vehicleYear': vehicleYear,
        'vehicleCapacity': vehicleCapacity,
        'vehicleType': vehicleType,
        'vehicleSubType': vehicleSubType,
        'vehicleImage': await MultipartFile.fromFile(vehicleImagePath),
        'vehicleNumberImage': await MultipartFile.fromFile(vehicleNumberImagePath),
        'rcImage': await MultipartFile.fromFile(rcImagePath),
        'vehicleInsuranceImage': await MultipartFile.fromFile(vehicleInsuranceImagePath),
      };

      for (final entry in state.extraVehicleDocuments.entries) {
        if (entry.value.isNotEmpty) {
          formMap[entry.key] = await MultipartFile.fromFile(entry.value);
        }
      }

      final formData = FormData.fromMap(formMap);

      final result = await repository.submitVehicleDetails(formData);
      switch (result) {
        case Success():
          state = state.copyWith(isLoading: false);
          await fetchRegistrationStatus();
          return true;
        case Failure(:final error):
          state = state.copyWith(isLoading: false);
          AppSnackbar.showError(message: NetworkExceptions.getErrorMessage(error));
          return false;
      }
    } catch (e) {
      AppLogger.e('Unexpected error submitting vehicle details', error: e);
      state = state.copyWith(isLoading: false);
      AppSnackbar.showError(message: 'Unexpected error submitting vehicle details');
      return false;
    }
  }

  // --- RESUBMIT REJECTED DOCUMENT ---
  Future<bool> resubmitDocument({
    required String stepId,
    required String documentKey,
    required String filePath,
  }) async {
    state = state.copyWith(isLoading: true);
    final repository = ref.read(authRepositoryProvider);

    try {
      final formData = FormData.fromMap({
        documentKey: await MultipartFile.fromFile(filePath),
      });

      final result = await repository.resubmitDocument(stepId, formData);
      switch (result) {
        case Success():
          AppSnackbar.showSuccess(message: 'Document resubmitted successfully!');
          await fetchRegistrationStatus();
          state = state.copyWith(isLoading: false);
          return true;
        case Failure(:final error):
          state = state.copyWith(isLoading: false);
          AppSnackbar.showError(message: NetworkExceptions.getErrorMessage(error));
          return false;
      }
    } catch (e) {
      AppLogger.e('Error resubmitting document', error: e);
      state = state.copyWith(isLoading: false);
      AppSnackbar.showError(message: 'Unexpected error during resubmission');
      return false;
    }
  }
}
