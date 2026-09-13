import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class DocumentUploadCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? filePath;
  final String? remoteUrl;
  final String? status; // draft, pending, verified, rejected
  final String? rejectionReason;
  final ValueChanged<String> onFileSelected;
  final bool isRequired;

  const DocumentUploadCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.filePath,
    this.remoteUrl,
    this.status,
    this.rejectionReason,
    required this.onFileSelected,
    this.isRequired = true,
  });

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    if (source == ImageSource.camera) {
      final titleLower = title.toLowerCase();
      final useFront = titleLower.contains('profile') ||
          titleLower.contains('selfie');

      try {
        final path = await context.push<String>(
          '/profile/camera_preview?useFront=$useFront',
        );

        if (path != null && path.isNotEmpty) {
          onFileSelected(path);
          return;
        }
      } catch (e) {
        debugPrint('Camera preview route error: $e');
      }

      // Fallback to platform native camera if custom camera preview is unavailable
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.camera, imageQuality: 85);
      if (image != null) {
        onFileSelected(image.path);
      }
    } else {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source, imageQuality: 85);
      if (image != null) {
        onFileSelected(image.path);
      }
    }
  }

  void _showPickerModal(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary500.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add_a_photo_rounded,
                    color: AppColors.primary500,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Upload $title',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.primary500,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
                    ),
                    title: Text(
                      'Take Photo with Camera',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Use in-app camera for quick capture',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(ctx);
                      _pickImage(context, ImageSource.camera);
                    },
                  ),
                  Divider(height: 1, color: isDark ? AppColors.neutral800 : AppColors.neutral200),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary500.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.photo_library_rounded, color: AppColors.primary500, size: 20),
                    ),
                    title: Text(
                      'Choose from Gallery',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Select an existing image from your device',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(ctx);
                      _pickImage(context, ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(bool hasFile) {
    Color bgColor;
    Color borderColor;
    Color textColor;
    IconData iconData;
    String label;

    if (hasFile && status == 'rejected') {
      bgColor = const Color(0xFF10B981).withValues(alpha: 0.15);
      borderColor = const Color(0xFF10B981).withValues(alpha: 0.4);
      textColor = const Color(0xFF10B981);
      iconData = Icons.check_circle_rounded;
      label = 'Ready to Resubmit';
    } else {
      switch (status) {
        case 'verified':
          bgColor = const Color(0xFF10B981).withValues(alpha: 0.12);
          borderColor = const Color(0xFF10B981).withValues(alpha: 0.35);
          textColor = const Color(0xFF10B981);
          iconData = Icons.verified_rounded;
          label = 'Verified';
          break;
        case 'rejected':
          bgColor = const Color(0xFFEF4444).withValues(alpha: 0.12);
          borderColor = const Color(0xFFEF4444).withValues(alpha: 0.35);
          textColor = const Color(0xFFEF4444);
          iconData = Icons.cancel_rounded;
          label = 'Action Required';
          break;
        case 'pending':
          bgColor = const Color(0xFFF59E0B).withValues(alpha: 0.12);
          borderColor = const Color(0xFFF59E0B).withValues(alpha: 0.35);
          textColor = const Color(0xFFF59E0B);
          iconData = Icons.hourglass_top_rounded;
          label = 'Under Review';
          break;
        default:
          if (status == null && !hasFile) return const SizedBox.shrink();
          bgColor = AppColors.neutral700.withValues(alpha: 0.12);
          borderColor = AppColors.neutral600.withValues(alpha: 0.25);
          textColor = AppColors.neutral400;
          iconData = Icons.edit_note_rounded;
          label = 'Draft';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 13, color: textColor),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasFile = (filePath != null && filePath!.isNotEmpty);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: hasFile
              ? const Color(0xFF10B981).withValues(alpha: 0.6)
              : (status == 'rejected'
                  ? const Color(0xFFEF4444).withValues(alpha: 0.6)
                  : (isDark ? AppColors.neutral800 : AppColors.neutral200)),
          width: hasFile || status == 'rejected' ? 1.4 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: title,
                        style: AppTextStyles.titleSmall.copyWith(
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          if (isRequired)
                            const TextSpan(
                              text: ' *',
                              style: TextStyle(
                                color: Color(0xFFEF4444),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _buildStatusChip(hasFile),
            ],
          ),

          if (rejectionReason != null && rejectionReason!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFEF4444).withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline_rounded, size: 20, color: Color(0xFFEF4444)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Reason: $rejectionReason',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: const Color(0xFFEF4444),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Upload Container Tile
          GestureDetector(
            onTap: () => _showPickerModal(context),
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: hasFile
                      ? AppColors.primary500
                      : (isDark ? AppColors.neutral700 : AppColors.neutral300),
                  width: hasFile ? 1.5 : 1.0,
                ),
              ),
              child: hasFile
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(File(filePath!), fit: BoxFit.cover),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withValues(alpha: 0.0),
                                    Colors.black.withValues(alpha: 0.4),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.primary500,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary500.withValues(alpha: 0.5),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
                                  SizedBox(width: 6),
                                  Text(
                                    'Change Photo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary500.withValues(alpha: 0.12),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.cloud_upload_rounded,
                            size: 32,
                            color: AppColors.primary500,
                          ),
                        )
                            .animate(onPlay: (c) => c.repeat(reverse: true))
                            .moveY(begin: 0, end: -4, duration: 1500.ms),
                        const SizedBox(height: 10),
                        Text(
                          'Tap to upload image',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Supports JPG, PNG (Max 5MB)',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.neutral500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
