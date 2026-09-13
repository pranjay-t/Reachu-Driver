import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reachu_driver/core/localization/locale_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_dimensions.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_cached_image.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/app_dropdown.dart';
import '../../../shared/utils/date_picker_helper.dart';
import '../providers/profile_controller.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _dobController;

  String _selectedGender = 'Male';
  final List<String> _genders = ['Male', 'Female', 'Other'];

  String? _localImagePath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final profileData = ref.read(profileControllerProvider).value;

    _nameController = TextEditingController(text: profileData?.name ?? '');
    _phoneController = TextEditingController(text: profileData?.phone ?? '');
    _emailController = TextEditingController(text: profileData?.email ?? '');

    String dobText = '';
    if (profileData?.dateOfBirth != null) {
      final date = profileData!.dateOfBirth!;
      dobText =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    }
    _dobController = TextEditingController(text: dobText);

    if (profileData?.gender != null && _genders.contains(profileData!.gender)) {
      _selectedGender = profileData.gender!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _showImagePickerBottomSheet() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppDimensions.radiusXL),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.space24,
                horizontal: AppDimensions.space16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkDivider
                          : AppColors.lightDivider,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space24),
                  Text(
                    context.l10n.updateProfilePicture,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImageOption(
                        icon: Icons.camera_alt_outlined,
                        label: context.l10n.camera,
                        onTap: () async {
                          context.pop(); // Close bottom sheet
                          final capturedImagePath = await context.push<String>(
                            '/profile/camera_preview?useFront=true',
                          );
                          if (capturedImagePath != null) {
                            setState(() {
                              _localImagePath = capturedImagePath;
                            });
                          }
                        },
                      ),
                      _buildImageOption(
                        icon: Icons.photo_library_outlined,
                        label: context.l10n.gallery,
                        onTap: () async {
                          context.pop(); // Close bottom sheet
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            setState(() {
                              _localImagePath = image.path;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.space32),
                  AppButton(
                    label: context.l10n.cancel,
                    onPressed: () => context.pop(),
                    variant: AppButtonVariant.secondary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.space16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  (isDark ? AppColors.darkSurface03 : AppColors.lightSurface03)
                      .withValues(alpha: 0.5),
              border: Border.all(
                color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
              ),
            ),
            child: Icon(icon, size: 32, color: AppColors.primary500),
          ),
          const SizedBox(height: AppDimensions.space8),
          Text(label, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Future<void> _handleUpdateProfile() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        await ref
            .read(profileControllerProvider.notifier)
            .updateProfile(
              name: _nameController.text,
              email: _emailController.text,
              gender: _selectedGender,
              dateOfBirth: _dobController.text,
              imagePath: _localImagePath,
            );

        if (mounted) {
          context.pop();
        }
      } catch (e) {
        // The global ErrorInterceptor automatically displays the premium snackbar for errors/failures.
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final profileData = ref.watch(profileControllerProvider).value;
    final networkImage = profileData?.image;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text(context.l10n.editProfile),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.space24,
                  vertical: AppDimensions.space16,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Profile Image
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDark
                                    ? AppColors.darkSurface03
                                    : AppColors.lightSurface03,
                                border: Border.all(
                                  color: AppColors.primary500,
                                  width: 3,
                                ),
                              ),
                              child: ClipOval(
                                child: _localImagePath != null
                                    ? Image.file(
                                        File(_localImagePath!),
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      )
                                    : (networkImage != null &&
                                          networkImage.isNotEmpty &&
                                          networkImage != 'null')
                                        ? AppCachedImage(
                                            imageUrl: networkImage,
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                            errorWidget: Center(
                                              child: Icon(
                                                Icons.person,
                                                size: 60,
                                                color: AppColors.neutral500,
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: Icon(
                                              Icons.person,
                                              size: 60,
                                              color: AppColors.neutral500,
                                            ),
                                          ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: _showImagePickerBottomSheet,
                                child: Container(
                                  padding: const EdgeInsets.all(
                                    AppDimensions.space8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary500,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: theme.scaffoldBackgroundColor,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primary500.withValues(
                                          alpha: 0.3,
                                        ),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.edit_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimensions.space48),

                      // Form Fields
                      AppTextField(
                        controller: _nameController,
                        label: context.l10n.fullName,
                        prefixIcon: Icons.person_outline,
                        validator: (value) => value == null || value.isEmpty
                            ? context.l10n.fullNameRequired
                            : null,
                        floatingLabelStyle: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: AppDimensions.space24),

                      // Phone Field (Read-only)
                      AppTextField(
                        controller: _phoneController,
                        label: context.l10n.mobileNumber,
                        prefixIcon: Icons.phone_outlined,
                        readOnly: true,
                        fillColor: isDark
                            ? AppColors.darkSurface02
                            : AppColors.lightSurface02,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.neutral500,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: AppColors.neutral500,
                        ),
                        floatingLabelStyle: const TextStyle(
                          fontSize: 16,
                          color: AppColors.neutral500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMD,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.neutral200,
                            width: 1,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                      //   child: Text(
                      //     'You cannot change your phone number.',
                      //     style: theme.textTheme.bodySmall?.copyWith(
                      //       color: isDark
                      //           ? AppColors.darkTextTertiary
                      //           : AppColors.lightTextTertiary,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: AppDimensions.space24),

                      AppTextField(
                        controller: _emailController,
                        label: context.l10n.email,
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        floatingLabelStyle: const TextStyle(fontSize: 16),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return context.l10n.emailRequired;
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value.trim())) {
                            return context.l10n.enterValidEmail;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppDimensions.space24),

                      AppTextField(
                        controller: _dobController,
                        label: context.l10n.dateOfBirthOptional,
                        prefixIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                        floatingLabelStyle: const TextStyle(fontSize: 16),
                        onTap: () async {
                          final initialDate = _dobController.text.isNotEmpty
                              ? DateTime.tryParse(_dobController.text) ??
                                    DateTime(1990)
                              : DateTime(1990);
                          final DateTime? pickedDate =
                              await showModernDatePicker(
                                context: context,
                                initialDate: initialDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                title: context.l10n.dateOfBirthOptional,
                                confirmLabel: context.l10n.done,
                                cancelLabel: context.l10n.cancel,
                              );
                          if (pickedDate != null) {
                            setState(() {
                              _dobController.text =
                                  "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                            });
                          }
                        },
                      ),
                      const SizedBox(height: AppDimensions.space24),

                      AppDropdown<String>(
                        initialValue: _selectedGender,
                        prefixIcon: Icons.people_outline,
                        label: context.l10n.gender,
                        hint: 'Select Gender',
                        items: _genders,
                        itemLabel: (gender) {
                          if (gender == 'Male') {
                            return context.l10n.male;
                          } else if (gender == 'Female') {
                            return context.l10n.female;
                          } else if (gender == 'Other') {
                            return context.l10n.other;
                          }
                          return gender;
                        },
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedGender = newValue;
                            });
                          }
                        },
                        validator: (value) =>
                            value == null ? 'Gender is required' : null,
                      ),
                      const SizedBox(height: AppDimensions.space48),
                      // Bottom Update Button
                      AppButton(
                        label: context.l10n.updateProfile,
                        onPressed: _handleUpdateProfile,
                        isLoading: _isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
