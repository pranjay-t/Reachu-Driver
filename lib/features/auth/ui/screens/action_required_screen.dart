import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../models/driver_registration_status_response.dart';
import '../../providers/driver_onboarding_controller.dart';
import '../../providers/verification_controller.dart';
import '../widgets/document_upload_card.dart';

class ActionRequiredScreen extends ConsumerStatefulWidget {
  const ActionRequiredScreen({super.key});

  @override
  ConsumerState<ActionRequiredScreen> createState() => _ActionRequiredScreenState();
}

class _ActionRequiredScreenState extends ConsumerState<ActionRequiredScreen> {
  final Map<String, String> _selectedFiles = {};
  bool _isSubmitting = false;
  String? _submittingStatusMessage;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(driverOnboardingControllerProvider);
    final controller = ref.read(driverOnboardingControllerProvider.notifier);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final actionItems = state.statusData?.actionRequired ?? [];
    final totalRequired = actionItems.length;
    final selectedCount = actionItems.where((item) {
      final key = '${item.stepId}_${item.documentKey}';
      return _selectedFiles.containsKey(key);
    }).length;

    final isAllSelected = (totalRequired > 0 && selectedCount == totalRequired);
    final hasAnySelected = (selectedCount > 0);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Document Resubmission'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh Status',
            onPressed: () => controller.fetchRegistrationStatus(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                            child: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 22),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Action Required on Documents',
                                  style: AppTextStyles.titleSmall.copyWith(
                                    color: const Color(0xFFEF4444),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Reviewer requested updated photos for the rejected document(s) listed below. Please upload clear photos to proceed with verification.',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
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

                    // Section Title & Dynamic Progress Counter Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rejected Documents',
                          style: AppTextStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                          ),
                        ),
                        if (totalRequired > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isAllSelected
                                  ? const Color(0xFF10B981).withValues(alpha: 0.15)
                                  : AppColors.primary500.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isAllSelected
                                    ? const Color(0xFF10B981).withValues(alpha: 0.4)
                                    : AppColors.primary500.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Text(
                              '$selectedCount of $totalRequired Updated',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: isAllSelected ? const Color(0xFF10B981) : AppColors.primary500,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    if (actionItems.isEmpty) ...[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Column(
                            children: [
                              const Icon(Icons.check_circle_outline_rounded, size: 64, color: Color(0xFF10B981)),
                              const SizedBox(height: 16),
                              Text(
                                'No documents pending resubmission.',
                                style: AppTextStyles.titleSmall.copyWith(
                                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      // List of Rejected Documents
                      ...actionItems.map((item) {
                        final fileKey = '${item.stepId}_${item.documentKey}';
                        final selectedPath = _selectedFiles[fileKey];

                        return DocumentUploadCard(
                          title: _formatDocumentKey(item.documentKey),
                          subtitle: 'Tap to pick or capture a replacement photo',
                          status: 'rejected',
                          rejectionReason: item.rejectionReason ?? 'Document rejected by verification team',
                          filePath: selectedPath,
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
                      label: hasAnySelected
                          ? 'Resubmit ${selectedCount == totalRequired ? "All" : "Selected"} Documents ($selectedCount/$totalRequired)'
                          : 'Select New Photo to Resubmit',
                      isLoading: _isSubmitting || state.isLoading,
                      onPressed: hasAnySelected && !_isSubmitting
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

  Future<void> _handleBatchResubmission(
    List<ActionRequiredItem> actionItems,
    DriverOnboardingController controller,
  ) async {
    final itemsToSubmit = actionItems.where((item) {
      final fileKey = '${item.stepId}_${item.documentKey}';
      return _selectedFiles.containsKey(fileKey);
    }).toList();

    if (itemsToSubmit.isEmpty) return;

    setState(() {
      _isSubmitting = true;
    });

    int successCount = 0;
    for (int i = 0; i < itemsToSubmit.length; i++) {
      final item = itemsToSubmit[i];
      final fileKey = '${item.stepId}_${item.documentKey}';
      final filePath = _selectedFiles[fileKey]!;

      setState(() {
        _submittingStatusMessage =
            'Resubmitting ${_formatDocumentKey(item.documentKey)} (${i + 1}/${itemsToSubmit.length})...';
      });

      final success = await controller.resubmitDocument(
        stepId: item.stepId,
        documentKey: item.documentKey,
        filePath: filePath,
      );

      if (success) {
        successCount++;
        setState(() {
          _selectedFiles.remove(fileKey);
        });
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

  String _formatDocumentKey(String key) {
    switch (key) {
      case 'profileImage':
        return 'Profile Photo';
      case 'dlImage':
        return 'Driving License';
      case 'aadharFront':
        return 'Aadhar Front';
      case 'aadharBack':
        return 'Aadhar Back';
      case 'panImage':
        return 'PAN Card';
      case 'vehicleImage':
        return 'Vehicle Photo';
      case 'vehicleNumberImage':
        return 'Vehicle Number Plate';
      case 'rcImage':
        return 'RC Document';
      case 'vehicleInsuranceImage':
        return 'Vehicle Insurance';
      default:
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
}
