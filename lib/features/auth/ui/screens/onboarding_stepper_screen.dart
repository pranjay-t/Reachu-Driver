import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_dropdown.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../models/city_model.dart';
import '../../models/onboarding_enums.dart';
import '../../models/vehicle_category.dart';
import '../../providers/driver_onboarding_controller.dart';
import 'package:go_router/go_router.dart';
import '../widgets/document_upload_card.dart';
import '../widgets/step_progress_header.dart';
import 'action_required_screen.dart';
import 'verification_status_screen.dart';

class OnboardingStepperScreen extends ConsumerStatefulWidget {
  final String phoneNumber;

  const OnboardingStepperScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  ConsumerState<OnboardingStepperScreen> createState() => _OnboardingStepperScreenState();
}

class _OnboardingStepperScreenState extends ConsumerState<OnboardingStepperScreen> {
  // Step 1 Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  late final TextEditingController _phoneController;
  String _selectedGender = 'Male';
  String? _selectedCityId;

  // Step 2 Controllers
  final _dlNumberController = TextEditingController();

  // Step 3 Controllers
  final _aadharNumberController = TextEditingController();
  final _panNumberController = TextEditingController();

  // Step 4 Controllers
  final _vehicleNameController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _vehicleColorController = TextEditingController();
  final _vehicleModelController = TextEditingController();
  final _vehicleYearController = TextEditingController();
  final _vehicleCapacityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: widget.phoneNumber);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(driverOnboardingControllerProvider);
      if (state.name.isNotEmpty) _nameController.text = state.name;
      if (state.email.isNotEmpty) _emailController.text = state.email;
      if (state.dateOfBirth.isNotEmpty) _dobController.text = state.dateOfBirth;
      if (state.gender.isNotEmpty) _selectedGender = state.gender;
      if (state.selectedCityId != null && state.selectedCityId!.isNotEmpty) {
        setState(() => _selectedCityId = state.selectedCityId);
      }
      if (state.vehicleName.isNotEmpty && _vehicleNameController.text.isEmpty) {
        _vehicleNameController.text = state.vehicleName;
      }
      if (state.vehicleNumber.isNotEmpty && _vehicleNumberController.text.isEmpty) {
        _vehicleNumberController.text = state.vehicleNumber;
      }
      if (state.vehicleColor.isNotEmpty && _vehicleColorController.text.isEmpty) {
        _vehicleColorController.text = state.vehicleColor;
      }
      if (state.vehicleModel.isNotEmpty && _vehicleModelController.text.isEmpty) {
        _vehicleModelController.text = state.vehicleModel;
      }
      if (state.vehicleYear.isNotEmpty && _vehicleYearController.text.isEmpty) {
        _vehicleYearController.text = state.vehicleYear;
      }
      if (state.vehicleCapacity.isNotEmpty && _vehicleCapacityController.text.isEmpty) {
        _vehicleCapacityController.text = state.vehicleCapacity;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _dlNumberController.dispose();
    _aadharNumberController.dispose();
    _panNumberController.dispose();
    _vehicleNameController.dispose();
    _vehicleNumberController.dispose();
    _vehicleColorController.dispose();
    _vehicleModelController.dispose();
    _vehicleYearController.dispose();
    _vehicleCapacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(driverOnboardingControllerProvider);
    final controller = ref.read(driverOnboardingControllerProvider.notifier);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Show loading spinner while initial registration status is being fetched to avoid screen flashing
    if (!state.isStatusLoaded && state.isLoading) {
      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.primary500),
        ),
      );
    }

    // Check if status requires document resubmission or is pending review
    if (state.statusData?.overallStatus == OverallStatus.actionRequired) {
      return const ActionRequiredScreen();
    } else if (state.statusData?.overallStatus == OverallStatus.pendingReview ||
        state.statusData?.overallStatus == 'pending_review' ||
        state.statusData?.overallStatus == 'pending') {
      return const VerificationStatusScreen();
    }

    final progress = _calculateProgressPercentage(state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Onboarding'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => controller.fetchRegistrationStatus(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Step Progress Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: StepProgressHeader(
                currentGroupIndex: state.activeGroupIndex,
                percentage: progress,
                activeStepLabel: _getGroupTitle(state.activeGroupIndex, state.activeSubStepIndex),
                onGroupTap: null,
              ),
            ),
            const Divider(height: 1),

            // Step Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
                child: Form(
                  key: _formKey,
                  child: KeyedSubtree(
                    key: ValueKey('${state.activeGroupIndex}_${state.activeSubStepIndex}'),
                    child: _buildGroupContent(state, controller, isDark)
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: 0.05, end: 0, duration: 300.ms, curve: Curves.easeOutCubic),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateProgressPercentage(DriverOnboardingState state) {
    if (state.statusData?.overallStatus == OverallStatus.pendingReview ||
        state.statusData?.overallStatus == OverallStatus.approved) {
      return 100.0;
    }

    switch (state.activeGroupIndex) {
      case 0:
        return state.activeSubStepIndex == 0 ? 0.0 : 12.5;
      case 1:
        return 25.0;
      case 2:
        return state.activeSubStepIndex == 0 ? 50.0 : 62.5;
      case 3:
        return 75.0;
      default:
        return 0.0;
    }
  }

  String _getGroupTitle(int groupIndex, int subStepIndex) {
    switch (groupIndex) {
      case 0:
        return subStepIndex == 0 ? 'Step 1: Personal Info' : 'Step 1: Profile Photo';
      case 1:
        return 'Step 2: Driving License';
      case 2:
        return subStepIndex == 0 ? 'Step 3: Aadhar Card' : 'Step 3: PAN Card';
      case 3:
        return 'Step 4: Vehicle Details';
      default:
        return 'Onboarding';
    }
  }

  Widget _buildGroupContent(
    DriverOnboardingState state,
    DriverOnboardingController controller,
    bool isDark,
  ) {
    switch (state.activeGroupIndex) {
      case 0:
        return _buildStep1PersonalDetails(state, controller, isDark);
      case 1:
        return _buildStep2DrivingLicense(state, controller, isDark);
      case 2:
        return _buildStep3IdentityDocuments(state, controller, isDark);
      case 3:
        return _buildStep4VehicleDetails(state, controller, isDark);
      default:
        return const SizedBox.shrink();
    }
  }

  // ==========================================
  // STEP 1: PERSONAL DETAILS & PROFILE PHOTO
  // ==========================================
  Widget _buildStep1PersonalDetails(
    DriverOnboardingState state,
    DriverOnboardingController controller,
    bool isDark,
  ) {
    if (state.activeSubStepIndex == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: AppTextStyles.titleLarge.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Please fill in your legal details as per official documents.',
            style: AppTextStyles.bodySmall.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 20),

          // Full Name (Read-only / Non-editable just like mobile number)
          AppTextField(
            controller: _nameController,
            label: 'Full Name',
            hint: 'Enter your full name',
            prefixIcon: Icons.person_outline_rounded,
            readOnly: true,
            fillColor: isDark
                ? AppColors.darkSurface02
                : AppColors.lightSurface02,
            style: TextStyle(
              color: isDark ? AppColors.neutral400 : AppColors.neutral600,
            ),
            labelStyle: TextStyle(
              fontSize: 14,
              color: isDark ? AppColors.neutral400 : AppColors.neutral500,
            ),
            floatingLabelStyle: TextStyle(
              fontSize: 16,
              color: isDark ? AppColors.neutral400 : AppColors.neutral500,
            ),
            suffix: Icon(
              Icons.lock_outline_rounded,
              size: 18,
              color: isDark ? AppColors.neutral500 : AppColors.neutral400,
            ),
            validator: (v) => v == null || v.isEmpty ? 'Full name is required' : null,
          ),
          const SizedBox(height: 16),

          // Mobile Number (Read-only)
          if (widget.phoneNumber.isNotEmpty) ...[
            AppTextField(
              controller: _phoneController,
              label: 'Mobile Number',
              hint: 'Registered phone number',
              prefixIcon: Icons.phone_outlined,
              readOnly: true,
              fillColor: isDark
                  ? AppColors.darkSurface02
                  : AppColors.lightSurface02,
              style: TextStyle(
                color: isDark ? AppColors.neutral400 : AppColors.neutral600,
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: isDark ? AppColors.neutral400 : AppColors.neutral500,
              ),
              floatingLabelStyle: TextStyle(
                fontSize: 16,
                color: isDark ? AppColors.neutral400 : AppColors.neutral500,
              ),
              suffix: Icon(
                Icons.lock_outline_rounded,
                size: 18,
                color: isDark ? AppColors.neutral500 : AppColors.neutral400,
              ),
            ),
            const SizedBox(height: 16),
          ],

          AppTextField(
            controller: _emailController,
            label: 'Email Address',
            hint: 'driver@example.com',
            keyboardType: TextInputType.emailAddress,
            validator: (v) => v == null || v.isEmpty ? 'Email is required' : null,
          ),
          const SizedBox(height: 16),

          GestureDetector(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime(1995, 1, 1),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                _dobController.text = date.toIso8601String().split('T')[0];
              }
            },
            child: AbsorbPointer(
              child: AppTextField(
                controller: _dobController,
                label: 'Date of Birth',
                hint: 'YYYY-MM-DD',
                suffix: const Icon(Icons.calendar_today_rounded),
                validator: (v) => v == null || v.isEmpty ? 'Date of birth is required' : null,
              ),
            ),
          ),
          const SizedBox(height: 16),

          AppDropdown<String>(
            label: 'Gender',
            items: const ['Male', 'Female', 'Other'],
            itemLabel: (item) => item,
            initialValue: _selectedGender,
            onChanged: (val) {
              if (val != null) setState(() => _selectedGender = val);
            },
          ),
          const SizedBox(height: 16),

          Builder(
            builder: (context) {
              final effectiveCityId = _selectedCityId ?? state.selectedCityId;
              CityModel? selectedCity;
              if (effectiveCityId != null && state.cities.isNotEmpty) {
                try {
                  selectedCity = state.cities.firstWhere((c) => c.id == effectiveCityId);
                } catch (_) {
                  selectedCity = null;
                }
              }

              return AppDropdown<CityModel>(
                label: 'Service City',
                hint: 'Select your operational city',
                items: state.cities,
                itemLabel: (city) => city.name,
                initialValue: selectedCity,
                prefixIcon: Icons.location_city_rounded,
                onChanged: (val) {
                  setState(() => _selectedCityId = val?.id);
                  if (val != null) {
                    controller.selectCity(val.id);
                  }
                },
                validator: (val) =>
                    (val == null && (_selectedCityId == null || _selectedCityId!.isEmpty))
                        ? 'Please select a serviceable city'
                        : null,
              );
            },
          ),
          const SizedBox(height: 30),

          AppButton(
            label: 'Save & Continue to Profile Photo',
            isLoading: state.isLoading,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                controller.submitStep1PersonalInfo(
                  name: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  dateOfBirth: _dobController.text.trim(),
                  gender: _selectedGender,
                  cityId: _selectedCityId ?? state.selectedCityId,
                );
              }
            },
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile Photo',
            style: AppTextStyles.titleLarge.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Upload a clear selfie or passport-size photo of yourself.',
            style: AppTextStyles.bodySmall.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 20),

          DocumentUploadCard(
            title: 'Profile Photo',
            subtitle: 'Clear front-facing photo without sunglasses or cap',
            filePath: state.profileImage,
            onFileSelected: (path) => controller.setDocument('profileImage', path),
          ),

          const SizedBox(height: 20),

          AppButton(
            label: 'Submit Profile Photo',
            isLoading: state.isLoading,
            onPressed: state.profileImage != null
                ? () => controller.submitStep1ProfilePhoto(state.profileImage!)
                : null,
          ),
        ],
      );
    }
  }

  // ==========================================
  // STEP 2: DRIVING LICENSE
  // ==========================================
  Widget _buildStep2DrivingLicense(
    DriverOnboardingState state,
    DriverOnboardingController controller,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Driving License',
          style: AppTextStyles.titleLarge.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Provide your driving license number and upload a clear photo.',
          style: AppTextStyles.bodySmall.copyWith(
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: 20),

        AppTextField(
          controller: _dlNumberController,
          label: 'DL Number',
          hint: 'e.g. DL-1420110012345',
          validator: (v) => v == null || v.isEmpty ? 'DL Number is required' : null,
        ),
        const SizedBox(height: 20),

        DocumentUploadCard(
          title: 'Driving License Photo',
          subtitle: 'Clear front photo showing DL number and expiry date',
          filePath: state.dlImage,
          onFileSelected: (path) => controller.setDocument('dlImage', path),
        ),

        const SizedBox(height: 24),

        AppButton(
          label: 'Submit Driving License',
          isLoading: state.isLoading,
          onPressed: state.dlImage != null
              ? () {
                  if (_formKey.currentState?.validate() ?? false) {
                    controller.submitStep2DrivingLicense(
                      dlNumber: _dlNumberController.text.trim(),
                      dlImagePath: state.dlImage!,
                    );
                  }
                }
              : null,
        ),
      ],
    );
  }

  // ==========================================
  // STEP 3: IDENTITY DOCUMENTS (AADHAR & PAN)
  // ==========================================
  Widget _buildStep3IdentityDocuments(
    DriverOnboardingState state,
    DriverOnboardingController controller,
    bool isDark,
  ) {
    if (state.activeSubStepIndex == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aadhar Card Details',
            style: AppTextStyles.titleLarge.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Provide 12-digit Aadhar number and upload front & back photos.',
            style: AppTextStyles.bodySmall.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 20),

          AppTextField(
            controller: _aadharNumberController,
            label: 'Aadhar Number',
            hint: '12-digit Aadhar number',
            keyboardType: TextInputType.number,
            validator: (v) => v == null || v.length != 12 ? 'Valid 12-digit Aadhar number required' : null,
          ),
          const SizedBox(height: 20),

          DocumentUploadCard(
            title: 'Aadhar Front Photo',
            subtitle: 'Front side with photo and full name',
            filePath: state.aadharFront,
            onFileSelected: (path) => controller.setDocument('aadharFront', path),
          ),

          DocumentUploadCard(
            title: 'Aadhar Back Photo',
            subtitle: 'Back side showing full permanent address',
            filePath: state.aadharBack,
            onFileSelected: (path) => controller.setDocument('aadharBack', path),
          ),

          const SizedBox(height: 20),

          AppButton(
            label: 'Save & Continue to PAN',
            isLoading: state.isLoading,
            onPressed: (state.aadharFront != null && state.aadharBack != null)
                ? () {
                    if (_formKey.currentState?.validate() ?? false) {
                      controller.submitStep3Aadhar(
                        aadharNumber: _aadharNumberController.text.trim(),
                        frontPath: state.aadharFront!,
                        backPath: state.aadharBack!,
                      );
                    }
                  }
                : null,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PAN Card Details',
            style: AppTextStyles.titleLarge.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Provide 10-character PAN number and upload PAN card photo.',
            style: AppTextStyles.bodySmall.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 20),

          AppTextField(
            controller: _panNumberController,
            label: 'PAN Number',
            hint: 'e.g. ABCDE1234F',
            validator: (v) => v == null || v.length != 10 ? 'Valid 10-character PAN number required' : null,
          ),
          const SizedBox(height: 20),

          DocumentUploadCard(
            title: 'PAN Card Photo',
            subtitle: 'Clear photo showing PAN number and name',
            filePath: state.panImage,
            onFileSelected: (path) => controller.setDocument('panImage', path),
          ),

          const SizedBox(height: 20),

          AppButton(
            label: 'Submit PAN Card',
            isLoading: state.isLoading,
            onPressed: state.panImage != null
                ? () {
                    if (_formKey.currentState?.validate() ?? false) {
                      controller.submitStep3Pan(
                        panNumber: _panNumberController.text.trim(),
                        panImagePath: state.panImage!,
                      );
                    }
                  }
                : null,
          ),
        ],
      );
    }
  }

  // ==========================================
  // STEP 4: VEHICLE DETAILS
  // ==========================================
  Widget _buildStep4VehicleDetails(
    DriverOnboardingState state,
    DriverOnboardingController controller,
    bool isDark,
  ) {
    final selectedCategory = state.categories.cast<VehicleCategory?>().firstWhere(
          (c) =>
              c?.id == state.selectedCategoryId ||
              (state.selectedCategoryId != null &&
                  c?.name.toLowerCase() == state.selectedCategoryId!.toLowerCase()),
          orElse: () => null,
        );

    // Auto-trigger loading subcategories if category is known and subcategories are empty
    if (state.selectedCategoryId != null &&
        state.selectedCategoryId!.isNotEmpty &&
        state.subCategories.isEmpty &&
        !state.isLoading) {
      Future.microtask(() {
        controller.loadSubCategories(state.selectedCategoryId!);
      });
    }

    final selectedSubCategory = state.subCategories.cast<VehicleSubCategory?>().firstWhere(
          (sc) =>
              sc?.id == state.selectedSubCategoryId ||
              (state.selectedSubCategoryId != null &&
                  sc?.name.toLowerCase() == state.selectedSubCategoryId!.toLowerCase()),
          orElse: () => null,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vehicle Information',
          style: AppTextStyles.titleLarge.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Provide vehicle specs and upload RC, insurance, vehicle & plate photos.',
          style: AppTextStyles.bodySmall.copyWith(
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: 20),

        AppTextField(
          controller: _vehicleNameController,
          label: 'Vehicle Name',
          hint: 'e.g. Maruti Suzuki Swift / Honda City',
          validator: (v) => v == null || v.isEmpty ? 'Vehicle name is required' : null,
        ),
        const SizedBox(height: 16),

        AppTextField(
          controller: _vehicleNumberController,
          label: 'Vehicle Registration Number',
          hint: 'e.g. MH02AB1234',
          validator: (v) => v == null || v.isEmpty ? 'Vehicle number is required' : null,
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _vehicleColorController,
                label: 'Vehicle Color',
                hint: 'White',
                validator: (v) => v == null || v.isEmpty ? 'Color required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppTextField(
                controller: _vehicleModelController,
                label: 'Vehicle Model',
                hint: 'VXi / ZXi',
                validator: (v) => v == null || v.isEmpty ? 'Model required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _vehicleYearController,
                label: 'Manufacture Year',
                hint: '2022',
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Year required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppTextField(
                controller: _vehicleCapacityController,
                label: 'Seating Capacity',
                hint: '4',
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Capacity required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Vehicle Category Dropdowns
        AppDropdown<VehicleCategory>(
          label: 'Vehicle Category',
          items: state.categories,
          itemLabel: (c) => c.name,
          hint: state.categories.isEmpty ? 'Loading categories...' : 'Select Category',
          initialValue: selectedCategory,
          onChanged: (val) {
            if (val != null) {
              controller.loadSubCategories(val.id);
            }
          },
        ),
        const SizedBox(height: 16),

        AppDropdown<VehicleSubCategory>(
          label: 'Vehicle Sub-Category',
          items: state.subCategories,
          itemLabel: (sc) => sc.name,
          hint: state.subCategories.isEmpty ? 'Loading sub-categories...' : 'Select Sub-Category',
          initialValue: selectedSubCategory,
          onChanged: (val) {
            if (val != null) {
              controller.selectSubCategory(val.id);
            }
          },
        ),
        const SizedBox(height: 24),

        Text(
          'Vehicle Document Uploads',
          style: AppTextStyles.titleMedium.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),

        DocumentUploadCard(
          title: 'Vehicle Photo',
          subtitle: 'Clear full view of the vehicle exterior',
          filePath: state.vehicleImage,
          onFileSelected: (path) => controller.setDocument('vehicleImage', path),
        ),

        DocumentUploadCard(
          title: 'Number Plate Photo',
          subtitle: 'Close-up photo showing license plate clearly',
          filePath: state.vehicleNumberImage,
          onFileSelected: (path) => controller.setDocument('vehicleNumberImage', path),
        ),

        DocumentUploadCard(
          title: 'RC Book / Document',
          subtitle: 'Registration Certificate (RC) document photo',
          filePath: state.rcImage,
          onFileSelected: (path) => controller.setDocument('rcImage', path),
        ),

        DocumentUploadCard(
          title: 'Vehicle Insurance Photo',
          subtitle: 'Valid insurance policy document photo',
          filePath: state.vehicleInsuranceImage,
          onFileSelected: (path) => controller.setDocument('vehicleInsuranceImage', path),
        ),

        // Dynamic Required Documents from SubCategory (e.g. fitnessCertificateImage, goodsPermitImage)
        if (selectedSubCategory != null &&
            selectedSubCategory.effectiveRequiredDocuments.isNotEmpty) ...[
          ...selectedSubCategory.effectiveRequiredDocuments.map((docKey) {
            final docTitle = _formatDocTitle(docKey);
            return DocumentUploadCard(
              title: docTitle,
              subtitle: 'Upload valid $docTitle document photo',
              filePath: state.extraVehicleDocuments[docKey],
              isRequired: true,
              onFileSelected: (path) => controller.setDocument(docKey, path),
            );
          }),
        ],

        const SizedBox(height: 24),

        Builder(
          builder: (context) {
            final requiredDocs = selectedSubCategory?.effectiveRequiredDocuments ?? [];
            final bool allExtraUploaded = requiredDocs.every(
              (docKey) =>
                  state.extraVehicleDocuments[docKey] != null &&
                  state.extraVehicleDocuments[docKey]!.isNotEmpty,
            );
            final bool isFormValid = state.vehicleImage != null &&
                state.vehicleNumberImage != null &&
                state.rcImage != null &&
                state.vehicleInsuranceImage != null &&
                state.selectedCategoryId != null &&
                state.selectedSubCategoryId != null &&
                allExtraUploaded;

            return AppButton(
              label: 'Complete Registration',
              isLoading: state.isLoading,
              onPressed: isFormValid
                  ? () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final success = await controller.submitStep4VehicleDetails(
                          vehicleName: _vehicleNameController.text.trim(),
                          vehicleNumber: _vehicleNumberController.text.trim(),
                          vehicleColor: _vehicleColorController.text.trim(),
                          vehicleModel: _vehicleModelController.text.trim(),
                          vehicleYear: _vehicleYearController.text.trim(),
                          vehicleCapacity: _vehicleCapacityController.text.trim(),
                          vehicleType: state.selectedCategoryId!,
                          vehicleSubType: state.selectedSubCategoryId!,
                          vehicleImagePath: state.vehicleImage!,
                          vehicleNumberImagePath: state.vehicleNumberImage!,
                          rcImagePath: state.rcImage!,
                          vehicleInsuranceImagePath: state.vehicleInsuranceImage!,
                        );
                        if (success && mounted) {
                          context.go('/verification');
                        }
                      }
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }

  String _formatDocTitle(String key) {
    final cleaned = key.replaceAll(RegExp(r'Image$|Photo$'), '');
    final title = cleaned.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
    if (title.isEmpty) return key;
    return title.split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }
}
