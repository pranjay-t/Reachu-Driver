import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/network/result.dart';
import '../../../core/utils/app_snackbar.dart';
import '../repositories/support_repository.dart';
import '../providers/support_controller.dart';
import '../../../shared/widgets/app_dropdown.dart';

class RaiseTicketScreen extends ConsumerStatefulWidget {
  const RaiseTicketScreen({super.key});

  @override
  ConsumerState<RaiseTicketScreen> createState() => _RaiseTicketScreenState();
}

class _RaiseTicketScreenState extends ConsumerState<RaiseTicketScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedCategory;
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _relatedOrderIdController =
      TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isLoading = false;

  List<Map<String, String>> _getCategories(BuildContext context) {
    return [
      {"value": "rideIssue", "label": context.l10n.ticketCategoryRideIssue},
      {"value": "payment", "label": context.l10n.ticketCategoryPayment},
      {"value": "account", "label": context.l10n.ticketCategoryAccount},
      {"value": "driverIssue", "label": context.l10n.ticketCategoryDriverIssue},
      {"value": "other", "label": context.l10n.ticketCategoryOther},
    ];
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _relatedOrderIdController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitTicket() async {
    if (_selectedCategory == null) {
      AppSnackbar.showError(message: context.l10n.pleaseSelectCategoryError);
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final repository = ref.read(supportRepositoryProvider);
    final result = await repository.createTicket(
      category: _selectedCategory!,
      subject: _subjectController.text.trim(),
      relatedOrderId: _relatedOrderIdController.text.trim(),
      message: _messageController.text.trim(),
    );

    setState(() {
      _isLoading = false;
    });

    switch (result) {
      case Success(:final data):
        if (data.success) {
          AppSnackbar.showSuccess(message: data.message);
          // Insert the newly created ticket into the ticket list state
          ref.read(supportTicketsProvider.notifier).addTicket(data.data);
          if (mounted) {
            context.pushReplacement('/support/chat/${data.data.id}');
          }
        } else {
          AppSnackbar.showError(message: data.message);
        }
      case Failure():
        // Error snackbar is automatically displayed by ApiInterceptor
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final secondaryTextColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final dividerColor = isDark ? AppColors.neutral800 : AppColors.neutral200;
    final categories = _getCategories(context);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          context.l10n.raiseSupportTicket,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.submitATicket,
                    style: AppTextStyles.titleSmall.copyWith(
                      color: primaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    context.l10n.explainIssueDetail,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ── Category Dropdown ──
                  Text(
                    context.l10n.categoryRequired,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AppDropdown<Map<String, String>>(
                    items: categories,
                    itemLabel: (cat) => cat["label"]!,
                    hint: context.l10n.selectIssueCategory,
                    initialValue: _selectedCategory == null
                        ? null
                        : categories.firstWhere(
                            (cat) => cat["value"] == _selectedCategory,
                          ),
                    onChanged: (val) {
                      setState(() {
                        _selectedCategory = val?["value"];
                      });
                    },
                    validator: (val) {
                      if (val == null) {
                        return context.l10n.pleaseSelectCategoryError;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),

                  // ── Subject Field ──
                  Text(
                    context.l10n.subjectRequired,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: dividerColor),
                    ),
                    child: TextFormField(
                      controller: _subjectController,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: primaryTextColor,
                      ),
                      decoration: InputDecoration(
                        hintText: context.l10n.briefSummaryHint,
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: secondaryTextColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return context.l10n.subjectRequiredError;
                        }
                        if (val.length < 5) {
                          return context.l10n.subjectMinLengthError;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // ── Message/Description Field ──
                  Text(
                    context.l10n.descriptionRequired,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: dividerColor),
                    ),
                    child: TextFormField(
                      controller: _messageController,
                      maxLines: 5,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: primaryTextColor,
                      ),
                      decoration: InputDecoration(
                        hintText: context.l10n.describeProblemHint,
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: secondaryTextColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return context.l10n.messageRequiredError;
                        }
                        if (val.length < 10) {
                          return context.l10n.messageMinLengthError;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // ── Submit Button ──
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submitTicket,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary500,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: AppColors.primary500
                            .withValues(alpha: 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 0,
                      ),
                      child: _isLoading
                          ? SizedBox(
                              height: 24.w,
                              width: 24.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2.5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              context.l10n.submitTicket,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
