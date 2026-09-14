import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_dropdown.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../models/city_model.dart';
import '../../models/driver_registration_status_response.dart';
import '../../models/vehicle_category.dart';
import '../../providers/driver_onboarding_controller.dart';
import '../../providers/verification_controller.dart';
import '../widgets/document_upload_card.dart';

class ActionRequiredScreen extends ConsumerStatefulWidget {
  const ActionRequiredScreen({super.key});

  @override
  ConsumerState<ActionRequiredScreen> createState() => _ActionRequiredScreenState();
}

class _ActionRequiredScreenState extends ConsumerState<ActionRequiredScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _fieldControllers = {};
  final Map<String, String> _selectedFiles = {};

  String? _selectedVehicleCategoryId;
  String? _selectedVehicleSubCategoryId;
  String? _selectedGender;
  String? _selectedCityId;

  bool _isSubmitting = false;
  String? _submittingStatusMessage;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final controller = ref.read(driverOnboardingControllerProvider.notifier);
      final state = ref.read(driverOnboardingControllerProvider);
      controller.loadCategories();
      controller.loadActiveCities();

      _initPreloadedValues(state);
    });
  }

  void _initPreloadedValues(DriverOnboardingState state) {
    if (state.statusData == null && !state.isStatusLoaded) return;

    final vType = state.statusData?.vehicleInfo?.vehicleType ??
        state.statusData?.steps?['vehicle_details']?.fields?['vehicleType']?.value?.toString() ??
        state.statusData?.steps?['vehicle_details']?.fields?['vehicleCategoryId']?.value?.toString() ??
        state.statusData?.uiSteps?['vehicle_preference']?.steps?['vehicle_details']?.fields?['vehicleType']?.value?.toString() ??
        state.selectedCategoryId;
    if (vType != null && vType.isNotEmpty) {
      _selectedVehicleCategoryId ??= vType;
      ref.read(driverOnboardingControllerProvider.notifier).loadSubCategories(vType);
    }

    _selectedVehicleSubCategoryId ??= state.statusData?.vehicleInfo?.vehicleSubType ??
        state.statusData?.steps?['vehicle_details']?.fields?['vehicleSubType']?.value?.toString() ??
        state.statusData?.steps?['vehicle_details']?.fields?['vehicleSubCategoryId']?.value?.toString() ??
        state.statusData?.uiSteps?['vehicle_preference']?.steps?['vehicle_details']?.fields?['vehicleSubType']?.value?.toString() ??
        state.selectedSubCategoryId;

    _selectedGender ??= state.statusData?.personalInfo?.gender ??
        state.statusData?.steps?['personal_info']?.fields?['gender']?.value?.toString() ??
        'Male';

    _selectedCityId ??= state.statusData?.personalInfo?.homeCityId ??
        state.statusData?.personalInfo?.cityId ??
        state.selectedCityId;

    _isInitialized = true;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    for (final controller in _fieldControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(driverOnboardingControllerProvider);
    final controller = ref.read(driverOnboardingControllerProvider.notifier);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Auto-init values if state updated with statusData
    if (!_isInitialized && state.statusData != null) {
      _initPreloadedValues(state);
    }

    final actionItems = state.statusData?.actionRequired ?? [];
    final fieldItems = actionItems.where((item) => item.isField).toList();
    final docItems = actionItems.where((item) => item.isDocument).toList();

    final totalRequired = actionItems.length;
    final updatedCount = _calculateUpdatedCount(actionItems);
    final isAllUpdated = (totalRequired > 0 && updatedCount == totalRequired);
    final hasAnyUpdated = (updatedCount > 0);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Action Required'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh Status',
            onPressed: () async {
              await controller.fetchRegistrationStatus();
              final updatedState = ref.read(driverOnboardingControllerProvider);
              _initPreloadedValues(updatedState);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Warning Header Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFEF4444).withValues(alpha: isDark ? 0.18 : 0.12),
                              const Color(0xFFDC2626).withValues(alpha: isDark ? 0.08 : 0.04),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xFFEF4444).withValues(alpha: 0.35),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFEF4444).withValues(alpha: 0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x35EF4444),
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.warning_amber_rounded,
                                  color: Colors.white, size: 22),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Corrections Required',
                                    style: AppTextStyles.titleSmall.copyWith(
                                      color: const Color(0xFFEF4444),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'The verification team reviewed your registration and requested updates. Your previously entered details are pre-filled below so you can directly correct and resubmit them.',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: isDark
                                          ? AppColors.darkTextSecondary
                                          : AppColors.lightTextSecondary,
                                      height: 1.35,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 350.ms).slideY(begin: -0.04, end: 0),

                      const SizedBox(height: 20),

                      // Overall Progress Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pending Items',
                            style: AppTextStyles.titleMedium.copyWith(
                              fontWeight: FontWeight.w700,
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                          ),
                          if (totalRequired > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isAllUpdated
                                    ? const Color(0xFF10B981).withValues(alpha: 0.15)
                                    : AppColors.primary500.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isAllUpdated
                                      ? const Color(0xFF10B981).withValues(alpha: 0.4)
                                      : AppColors.primary500.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                '$updatedCount of $totalRequired Updated',
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: isAllUpdated
                                      ? const Color(0xFF10B981)
                                      : AppColors.primary500,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      if (actionItems.isEmpty) ...[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Column(
                              children: [
                                const Icon(Icons.check_circle_outline_rounded,
                                    size: 64, color: Color(0xFF10B981)),
                                const SizedBox(height: 16),
                                Text(
                                  'No items pending resubmission.',
                                  style: AppTextStyles.titleSmall.copyWith(
                                    color: isDark
                                        ? AppColors.darkTextPrimary
                                        : AppColors.lightTextPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],

                      // ==========================================
                      // REQUIRED FIELD CORRECTIONS SECTION
                      // ==========================================
                      if (fieldItems.isNotEmpty) ...[
                        Row(
                          children: [
                            const Icon(Icons.edit_note_rounded,
                                size: 18, color: AppColors.primary500),
                            const SizedBox(width: 8),
                            Text(
                              'Form Fields (${fieldItems.length})',
                              style: AppTextStyles.titleSmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...fieldItems.map((item) => _buildFieldCorrectionCard(
                              item,
                              state,
                              controller,
                              isDark,
                            )),
                        const SizedBox(height: 16),
                      ],

                      // ==========================================
                      // REQUIRED DOCUMENT PHOTOS SECTION
                      // ==========================================
                      if (docItems.isNotEmpty) ...[
                        Row(
                          children: [
                            const Icon(Icons.photo_camera_back_outlined,
                                size: 18, color: AppColors.primary500),
                            const SizedBox(width: 8),
                            Text(
                              'Document Photos (${docItems.length})',
                              style: AppTextStyles.titleSmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...docItems.map((item) {
                          final docKey = item.documentKey ?? item.itemKey;
                          final fileKey = '${item.stepId}_$docKey';
                          final selectedPath = _selectedFiles[fileKey];

                          return DocumentUploadCard(
                            title: item.displayLabel,
                            subtitle: 'Tap to pick or capture a replacement photo',
                            status: 'rejected',
                            rejectionReason: item.rejectionReason ??
                                'Document rejected by verification team',
                            filePath: selectedPath,
                            isRequired: true,
                            onFileSelected: (path) {
                              setState(() {
                                _selectedFiles[fileKey] = path;
                              });
                            },
                          );
                        }),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // Fixed Bottom Resubmit Action Bar
            if (actionItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface00,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, -4),
                    ),
                  ],
                  border: Border(
                    top: BorderSide(
                      color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_submittingStatusMessage != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          _submittingStatusMessage!,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                    AppButton(
                      label: hasAnyUpdated
                          ? 'Resubmit Details ($updatedCount/$totalRequired)'
                          : 'Update Details to Resubmit',
                      isLoading: _isSubmitting || state.isLoading,
                      onPressed: hasAnyUpdated && !_isSubmitting
                          ? () => _handleBatchResubmission(actionItems, controller)
                          : null,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  int _calculateUpdatedCount(List<ActionRequiredItem> actionItems) {
    int count = 0;
    for (final item in actionItems) {
      if (item.isField) {
        final fieldKey = item.fieldKey ?? item.itemKey;
        if (fieldKey == 'vehicleType' || fieldKey == 'vehicleCategoryId') {
          if (_selectedVehicleCategoryId != null &&
              _selectedVehicleCategoryId!.isNotEmpty) {
            count++;
          }
        } else if (fieldKey == 'vehicleSubType' || fieldKey == 'vehicleSubCategoryId') {
          if (_selectedVehicleSubCategoryId != null &&
              _selectedVehicleSubCategoryId!.isNotEmpty) {
            count++;
          }
        } else if (fieldKey == 'gender') {
          if (_selectedGender != null && _selectedGender!.isNotEmpty) {
            count++;
          }
        } else if (fieldKey == 'cityId' || fieldKey == 'city') {
          if (_selectedCityId != null && _selectedCityId!.isNotEmpty) {
            count++;
          }
        } else {
          final text = _fieldControllers[item.itemKey]?.text.trim();
          if (text != null && text.isNotEmpty) {
            count++;
          }
        }
      } else {
        final docKey = item.documentKey ?? item.itemKey;
        final fileKey = '${item.stepId}_$docKey';
        if (_selectedFiles.containsKey(fileKey) && _selectedFiles[fileKey]!.isNotEmpty) {
          count++;
        }
      }
    }
    return count;
  }

  String? _getPreviousFieldValue(ActionRequiredItem item, DriverOnboardingState state) {
    final statusData = state.statusData;
    if (statusData == null) return null;

    final fieldKey = item.fieldKey ?? item.itemKey;
    final stepId = item.stepId;

    // 1. Direct step fields from statusData.steps
    final stepDetail = statusData.steps?[stepId];
    if (stepDetail?.fields != null && stepDetail!.fields!.containsKey(fieldKey)) {
      final f = stepDetail.fields![fieldKey];
      if (f?.value != null && f!.value.toString().trim().isNotEmpty) {
        return f.value.toString().trim();
      }
      if (f?.displayValue != null && f!.displayValue!.toString().trim().isNotEmpty) {
        return f.displayValue!.toString().trim();
      }
    }

    // 2. uiSteps nested steps
    if (statusData.uiSteps != null) {
      for (final uiGroup in statusData.uiSteps!.values) {
        final uiStep = uiGroup.steps?[stepId];
        if (uiStep?.fields != null && uiStep!.fields!.containsKey(fieldKey)) {
          final f = uiStep.fields![fieldKey];
          if (f?.value != null && f!.value.toString().trim().isNotEmpty) {
            return f.value.toString().trim();
          }
          if (f?.displayValue != null && f!.displayValue!.toString().trim().isNotEmpty) {
            return f.displayValue!.toString().trim();
          }
        }
      }
    }

    // 3. Fallback to domain models
    switch (fieldKey) {
      case 'vehicleNumber':
        return statusData.vehicleInfo?.vehicleNumber;
      case 'vehicleName':
        return statusData.vehicleInfo?.vehicleName;
      case 'vehicleColor':
        return statusData.vehicleInfo?.vehicleColor;
      case 'vehicleModel':
        return statusData.vehicleInfo?.vehicleModel;
      case 'vehicleYear':
        return statusData.vehicleInfo?.vehicleYear;
      case 'vehicleCapacity':
        return statusData.vehicleInfo?.vehicleCapacity;
      case 'vehicleType':
      case 'vehicleCategoryId':
        return statusData.vehicleInfo?.vehicleType;
      case 'vehicleSubType':
      case 'vehicleSubCategoryId':
        return statusData.vehicleInfo?.vehicleSubType;
      case 'name':
      case 'fullName':
        return statusData.personalInfo?.name;
      case 'email':
        return statusData.personalInfo?.email;
      case 'dateOfBirth':
      case 'dob':
        return statusData.personalInfo?.dateOfBirth;
      case 'gender':
        return statusData.personalInfo?.gender;
      case 'cityId':
      case 'city':
        return statusData.personalInfo?.homeCityId ?? statusData.personalInfo?.cityId;
      case 'dlNumber':
        return statusData.kycInfo?['dlNumber']?.toString();
      case 'aadharNumber':
        return statusData.kycInfo?['aadharNumber']?.toString();
      case 'panNumber':
        return statusData.kycInfo?['panNumber']?.toString();
      default:
        return null;
    }
  }

  Widget _buildFieldCorrectionCard(
    ActionRequiredItem item,
    DriverOnboardingState state,
    DriverOnboardingController controller,
    bool isDark,
  ) {
    final fieldKey = item.fieldKey ?? item.itemKey;
    final label = item.displayLabel;
    final reason = item.rejectionReason ?? 'Field details rejected by verification team';

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface00,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFEF4444).withValues(alpha: isDark ? 0.35 : 0.22),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rejection reason banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFEF4444).withValues(alpha: isDark ? 0.14 : 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFFEF4444).withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.error_outline_rounded,
                    size: 16,
                    color: Color(0xFFEF4444),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    reason,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFFEF4444),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Direct input element with previously entered value prefilled
          _buildFieldInput(item, fieldKey, label, state, controller, isDark),
        ],
      ),
    );
  }

  Widget _buildFieldInput(
    ActionRequiredItem item,
    String fieldKey,
    String label,
    DriverOnboardingState state,
    DriverOnboardingController controller,
    bool isDark,
  ) {
    // 1. Vehicle Category Dropdown
    if (fieldKey == 'vehicleType' || fieldKey == 'vehicleCategoryId') {
      final effectiveCatId = _selectedVehicleCategoryId ??
          _getPreviousFieldValue(item, state) ??
          state.statusData?.vehicleInfo?.vehicleType ??
          state.selectedCategoryId;

      VehicleCategory? selectedCategory;
      if (effectiveCatId != null && effectiveCatId.isNotEmpty && state.categories.isNotEmpty) {
        try {
          selectedCategory = state.categories.firstWhere(
            (c) => c.id == effectiveCatId || c.name.toLowerCase() == effectiveCatId.toLowerCase(),
          );
        } catch (_) {
          selectedCategory = null;
        }
      }

      if (selectedCategory != null && _selectedVehicleCategoryId != selectedCategory.id) {
        _selectedVehicleCategoryId = selectedCategory.id;
        if (state.subCategories.isEmpty) {
          Future.microtask(() {
            controller.loadSubCategories(selectedCategory!.id);
          });
        }
      }

      return AppDropdown<VehicleCategory>(
        label: label,
        items: state.categories,
        itemLabel: (c) => c.name,
        hint: state.categories.isEmpty ? 'Loading categories...' : 'Select Category',
        initialValue: selectedCategory,
        prefixIcon: Icons.directions_car_rounded,
        onChanged: (val) {
          setState(() {
            _selectedVehicleCategoryId = val?.id;
            _selectedVehicleSubCategoryId = null;
          });
          if (val != null) {
            controller.loadSubCategories(val.id);
          }
        },
        validator: (val) => (_selectedVehicleCategoryId == null || _selectedVehicleCategoryId!.isEmpty)
            ? 'Please select a vehicle category'
            : null,
      );
    }

    // 2. Vehicle Sub-Category Dropdown
    if (fieldKey == 'vehicleSubType' || fieldKey == 'vehicleSubCategoryId') {
      final effectiveCatId = _selectedVehicleCategoryId ??
          _getPreviousFieldValue(item, state) ??
          state.statusData?.vehicleInfo?.vehicleType ??
          state.selectedCategoryId;

      // Automatically trigger loading subcategories if category is known and subcategories are empty
      if (effectiveCatId != null &&
          effectiveCatId.isNotEmpty &&
          state.subCategories.isEmpty &&
          !state.isLoading) {
        Future.microtask(() {
          controller.loadSubCategories(effectiveCatId);
        });
      }

      final effectiveSubCatId = _selectedVehicleSubCategoryId ??
          _getPreviousFieldValue(item, state) ??
          state.statusData?.vehicleInfo?.vehicleSubType ??
          state.selectedSubCategoryId;

      VehicleSubCategory? selectedSubCategory;
      if (effectiveSubCatId != null && effectiveSubCatId.isNotEmpty && state.subCategories.isNotEmpty) {
        try {
          selectedSubCategory = state.subCategories.firstWhere(
            (sc) => sc.id == effectiveSubCatId || sc.name.toLowerCase() == effectiveSubCatId.toLowerCase(),
          );
        } catch (_) {
          selectedSubCategory = null;
        }
      }

      if (selectedSubCategory != null && _selectedVehicleSubCategoryId != selectedSubCategory.id) {
        _selectedVehicleSubCategoryId = selectedSubCategory.id;
      }

      return AppDropdown<VehicleSubCategory>(
        label: label,
        items: state.subCategories,
        itemLabel: (sc) => sc.name,
        hint: state.subCategories.isEmpty ? 'Loading sub-categories...' : 'Select Sub-Category',
        initialValue: selectedSubCategory,
        prefixIcon: Icons.category_rounded,
        onChanged: (val) {
          setState(() {
            _selectedVehicleSubCategoryId = val?.id;
          });
        },
        validator: (val) => (_selectedVehicleSubCategoryId == null || _selectedVehicleSubCategoryId!.isEmpty)
            ? 'Please select a vehicle sub-category'
            : null,
      );
    }

    // 3. Date of Birth Picker
    if (fieldKey == 'dateOfBirth' || fieldKey == 'dob') {
      final ctrl = _fieldControllers.putIfAbsent(item.itemKey, () {
        var rawDate = _getPreviousFieldValue(item, state) ??
            state.statusData?.personalInfo?.dateOfBirth ??
            '';
        if (rawDate.contains('T')) {
          rawDate = rawDate.split('T')[0];
        }
        return TextEditingController(text: rawDate);
      });

      return GestureDetector(
        onTap: () async {
          final parsedDate = DateTime.tryParse(ctrl.text) ?? DateTime(1995, 1, 1);
          final date = await showDatePicker(
            context: context,
            initialDate: parsedDate,
            firstDate: DateTime(1950),
            lastDate: DateTime.now(),
          );
          if (date != null) {
            setState(() {
              ctrl.text = date.toIso8601String().split('T')[0];
            });
          }
        },
        child: AbsorbPointer(
          child: AppTextField(
            controller: ctrl,
            label: label,
            hint: 'YYYY-MM-DD',
            prefixIcon: Icons.calendar_today_rounded,
            validator: (v) => v == null || v.trim().isEmpty ? '$label is required' : null,
          ),
        ),
      );
    }

    // 4. Gender Dropdown
    if (fieldKey == 'gender') {
      final effectiveGender = _selectedGender ??
          _getPreviousFieldValue(item, state) ??
          state.statusData?.personalInfo?.gender ??
          'Male';

      return AppDropdown<String>(
        label: label,
        items: const ['Male', 'Female', 'Other'],
        itemLabel: (item) => item,
        initialValue: effectiveGender,
        prefixIcon: Icons.person_outline_rounded,
        onChanged: (val) {
          if (val != null) {
            setState(() => _selectedGender = val);
          }
        },
        validator: (val) => (_selectedGender == null || _selectedGender!.isEmpty)
            ? 'Please select gender'
            : null,
      );
    }

    // 5. Service City Dropdown
    if (fieldKey == 'cityId' || fieldKey == 'city') {
      final effectiveCityId = _selectedCityId ??
          _getPreviousFieldValue(item, state) ??
          state.statusData?.personalInfo?.homeCityId ??
          state.statusData?.personalInfo?.cityId;

      CityModel? selectedCity;
      if (effectiveCityId != null && state.cities.isNotEmpty) {
        try {
          selectedCity = state.cities.firstWhere((c) => c.id == effectiveCityId);
        } catch (_) {
          selectedCity = null;
        }
      }

      return AppDropdown<CityModel>(
        label: label,
        items: state.cities,
        itemLabel: (city) => city.name,
        hint: 'Select your operational city',
        initialValue: selectedCity,
        prefixIcon: Icons.location_city_rounded,
        onChanged: (val) {
          setState(() => _selectedCityId = val?.id);
        },
        validator: (val) => (_selectedCityId == null || _selectedCityId!.isEmpty)
            ? 'Please select a city'
            : null,
      );
    }

    // 6. Generic Text Fields (Vehicle Number, Name, Email, DL, Aadhar, PAN, etc.)
    TextInputType keyboardType = TextInputType.text;
    IconData prefixIcon = Icons.edit_note_rounded;

    if (fieldKey.toLowerCase().contains('email')) {
      keyboardType = TextInputType.emailAddress;
      prefixIcon = Icons.email_outlined;
    } else if (fieldKey.toLowerCase().contains('year') ||
        fieldKey.toLowerCase().contains('capacity') ||
        fieldKey.toLowerCase().contains('aadhar')) {
      keyboardType = TextInputType.number;
      prefixIcon = Icons.numbers_rounded;
    } else if (fieldKey.toLowerCase().contains('vehicle') ||
        fieldKey.toLowerCase().contains('car') ||
        fieldKey.toLowerCase().contains('plate')) {
      prefixIcon = Icons.directions_car_filled_rounded;
    } else if (fieldKey.toLowerCase().contains('name')) {
      prefixIcon = Icons.person_outline_rounded;
    } else if (fieldKey.toLowerCase().contains('dl') ||
        fieldKey.toLowerCase().contains('license') ||
        fieldKey.toLowerCase().contains('pan')) {
      prefixIcon = Icons.badge_outlined;
    }

    final ctrl = _fieldControllers.putIfAbsent(item.itemKey, () {
      final initial = _getPreviousFieldValue(item, state) ?? '';
      return TextEditingController(text: initial);
    });

    return AppTextField(
      controller: ctrl,
      label: label,
      hint: 'Enter corrected $label',
      keyboardType: keyboardType,
      prefixIcon: prefixIcon,
      onChanged: (_) => setState(() {}),
      validator: (v) => v == null || v.trim().isEmpty ? '$label is required' : null,
    );
  }

  Future<void> _handleBatchResubmission(
    List<ActionRequiredItem> actionItems,
    DriverOnboardingController controller,
  ) async {
    if (!(_formKey.currentState?.validate() ?? true)) {
      return;
    }

    final fieldItems = actionItems.where((item) => item.isField).toList();
    final docItems = actionItems.where((item) => item.isDocument).toList();

    // Group updates by stepId
    final Map<String, Map<String, dynamic>> stepFields = {};
    final Map<String, Map<String, String>> stepFiles = {};

    for (final item in fieldItems) {
      final stepId = item.stepId;
      final fieldKey = item.fieldKey ?? item.itemKey;
      dynamic val;
      if (fieldKey == 'vehicleType' || fieldKey == 'vehicleCategoryId') {
        val = _selectedVehicleCategoryId;
      } else if (fieldKey == 'vehicleSubType' || fieldKey == 'vehicleSubCategoryId') {
        val = _selectedVehicleSubCategoryId;
      } else if (fieldKey == 'gender') {
        val = _selectedGender;
      } else if (fieldKey == 'cityId' || fieldKey == 'city') {
        val = _selectedCityId;
      } else {
        val = _fieldControllers[item.itemKey]?.text.trim();
      }
      if (val != null && val.toString().isNotEmpty) {
        stepFields.putIfAbsent(stepId, () => {})[fieldKey] = val;
      }
    }

    for (final item in docItems) {
      final stepId = item.stepId;
      final docKey = item.documentKey ?? item.itemKey;
      final fileKey = '${item.stepId}_$docKey';
      final filePath = _selectedFiles[fileKey];
      if (filePath != null && filePath.isNotEmpty) {
        stepFiles.putIfAbsent(stepId, () => {})[docKey] = filePath;
      }
    }

    final allStepIds = {...stepFields.keys, ...stepFiles.keys}.toList();
    if (allStepIds.isEmpty) return;

    setState(() {
      _isSubmitting = true;
    });

    int successCount = 0;
    for (int i = 0; i < allStepIds.length; i++) {
      final stepId = allStepIds[i];
      final fields = stepFields[stepId];
      final files = stepFiles[stepId];

      setState(() {
        _submittingStatusMessage =
            'Resubmitting updates for $stepId (${i + 1}/${allStepIds.length})...';
      });

      final success = await controller.resubmitStepData(
        stepId: stepId,
        fields: fields,
        files: files,
      );

      if (success) {
        successCount++;
        if (files != null) {
          for (final docKey in files.keys) {
            setState(() {
              _selectedFiles.remove('${stepId}_$docKey');
            });
          }
        }
      }
    }

    setState(() {
      _isSubmitting = false;
      _submittingStatusMessage = null;
    });

    if (successCount > 0) {
      await controller.fetchRegistrationStatus();
      await ref.read(verificationControllerProvider.notifier).checkVerification('');
      if (mounted) {
        context.go('/verification');
      }
    }
  }
}
