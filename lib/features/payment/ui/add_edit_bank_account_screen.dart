import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../account/providers/profile_controller.dart';
import '../providers/bank_accounts_controller.dart';
import '../models/payment_models.dart';

class AddEditBankAccountScreen extends ConsumerStatefulWidget {
  final String? accountId;

  const AddEditBankAccountScreen({super.key, this.accountId});

  @override
  ConsumerState<AddEditBankAccountScreen> createState() => _AddEditBankAccountScreenState();
}

class _AddEditBankAccountScreenState extends ConsumerState<AddEditBankAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  // Input Controllers
  final _holderNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _accountNoController = TextEditingController();
  final _confirmAccountNoController = TextEditingController();
  final _ifscController = TextEditingController();

  bool _isEditMode = false;
  bool _isVerifying = false;
  bool _isSaving = false;
  bool _obscureAccountNo = true;
  bool _obscureConfirmAccountNo = true;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.accountId != null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isEditMode) {
        _populateFields();
      } else {
        _prefillProfileDetails();
      }
    });
  }

  void _prefillProfileDetails() {
    final profileAsync = ref.read(profileControllerProvider);
    profileAsync.whenData((profile) {
      if (_holderNameController.text.trim().isEmpty && (profile.name?.isNotEmpty ?? false)) {
        setState(() {
          _holderNameController.text = profile.name!.trim();
        });
      }
      if (_phoneController.text.trim().isEmpty && profile.phone.isNotEmpty) {
        setState(() {
          _phoneController.text = profile.phone.trim();
        });
      }
    });
  }

  void _populateFields() {
    final accounts = ref.read(bankAccountsControllerProvider).value;
    if (accounts == null) return;

    final account = accounts.firstWhere(
      (element) => element.id == widget.accountId,
      orElse: () => const BankAccountData(id: '', driverId: '', type: 'BankAccount'),
    );

    if (account.id.isEmpty) return;

    setState(() {
      _holderNameController.text = account.accountHolderName ?? '';
      _accountNoController.text = account.accountNumber ?? '';
      _confirmAccountNoController.text = account.accountNumber ?? '';
      _ifscController.text = account.ifscCode ?? '';
    });

    final profileAsync = ref.read(profileControllerProvider);
    profileAsync.whenData((profile) {
      if (_phoneController.text.trim().isEmpty && profile.phone.isNotEmpty) {
        setState(() {
          _phoneController.text = profile.phone.trim();
        });
      }
    });
  }

  @override
  void dispose() {
    _holderNameController.dispose();
    _phoneController.dispose();
    _accountNoController.dispose();
    _confirmAccountNoController.dispose();
    _ifscController.dispose();
    super.dispose();
  }

  Future<void> _handleVerificationAndSave() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).clearSnackBars();

    setState(() {
      _isVerifying = true;
    });

    final accountNumber = _accountNoController.text.trim();
    final ifscCode = _ifscController.text.trim().toUpperCase();
    final accountHolderName = _holderNameController.text.trim();
    final phone = _phoneController.text.trim();

    try {
      final result = await ref.read(bankAccountsControllerProvider.notifier).verifyBankAccount(
            accountNumber: accountNumber,
            ifscCode: ifscCode,
            accountHolderName: accountHolderName,
            phone: phone,
          );

      if (!mounted) return;

      if (!result.verified) {
        AppSnackbar.showError(
          context: context,
          message: context.l10n.bankVerificationFailed,
        );
        return;
      }

      // Populate official name from bank verification response
      if (result.nameAtBank?.isNotEmpty ?? false) {
        _holderNameController.text = result.nameAtBank!.trim();
      }

      // Show GPay/PhonePe-style Verification Details Modal without any snackbar
      ScaffoldMessenger.of(context).clearSnackBars();
      _showVerificationSummaryModal(result);
    } catch (e) {
      if (mounted) {
        AppSnackbar.showError(
          context: context,
          message: e.toString().replaceAll('Exception:', '').trim(),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isVerifying = false;
        });
      }
    }
  }

  /// GPay / PhonePe style verified bank details bottom sheet modal
  void _showVerificationSummaryModal(BankAccountVerificationData result) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final surfaceColor = isDark ? const Color(0xFF161B22) : Colors.white;
    final cardBg = isDark ? const Color(0xFF1F2937) : const Color(0xFFF8FAFC);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) => SafeArea(
        top: false,
        bottom: true,
        child: StatefulBuilder(
          builder: (context, setModalState) => Container(
            margin: EdgeInsets.only(top: 40.h),
            padding: EdgeInsets.fromLTRB(
              20.w,
              16.h,
              20.w,
              MediaQuery.viewInsetsOf(context).bottom + 16.h,
            ),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 25,
                  offset: const Offset(0, -6),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      width: 44.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.neutral700 : AppColors.neutral300,
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Header with Verified Status Pill (GPay style)
                  Row(
                    children: [
                      Container(
                        width: 48.r,
                        height: 48.r,
                        decoration: BoxDecoration(
                          color: AppColors.successLight.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.verified_rounded,
                            color: AppColors.successLight,
                            size: 28.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.bankVerificationSuccess,
                              style: AppTextStyles.titleMedium.copyWith(
                                color: primaryTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              context.l10n.bankVerificationSuccessDesc,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: mutedTextColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: AppColors.successLight.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.successLight.withValues(alpha: 0.5),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: AppColors.successLight,
                              size: 13.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              context.l10n.verifiedBadge,
                              style: TextStyle(
                                color: AppColors.successLight,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Modern GPay-style Bank Card Container
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Bank Name & Icon Header
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.primary500.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.account_balance_rounded,
                                color: AppColors.primary500,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result.bankName ?? 'Bank Verified',
                                    style: AppTextStyles.titleMedium.copyWith(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  if (result.branch != null && result.branch!.isNotEmpty) ...[
                                    SizedBox(height: 2.h),
                                    Text(
                                      "${result.branch!}${result.city != null ? ', ${result.city!}' : ''}",
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: mutedTextColor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Divider(
                            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                            height: 1,
                          ),
                        ),

                        // Registered Name at Bank (Highlighted)
                        _buildGPayMetaRow(
                          context: context,
                          label: context.l10n.registeredNameAtBank,
                          value: result.nameAtBank ?? _holderNameController.text.trim(),
                          isHighlighted: true,
                          isDark: isDark,
                        ),
                        SizedBox(height: 12.h),

                        // Account Number Masked
                        _buildGPayMetaRow(
                          context: context,
                          label: context.l10n.accountNumber,
                          value: _maskAccountNumber(_accountNoController.text.trim()),
                          isDark: isDark,
                        ),
                        SizedBox(height: 12.h),

                        // IFSC Code
                        _buildGPayMetaRow(
                          context: context,
                          label: context.l10n.ifscCode,
                          value: _ifscController.text.trim().toUpperCase(),
                          isDark: isDark,
                        ),
                        SizedBox(height: 12.h),

                        // Linked Phone
                        _buildGPayMetaRow(
                          context: context,
                          label: context.l10n.bankRegisteredPhone,
                          value: "+91 ${_phoneController.text.trim()}",
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Security note
                  Row(
                    children: [
                      Icon(
                        Icons.lock_outline_rounded,
                        color: isDark ? AppColors.neutral500 : AppColors.neutral400,
                        size: 14.sp,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          'Encrypted with 256-bit bank grade security for instant payouts.',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: isDark ? AppColors.neutral400 : AppColors.neutral500,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(modalContext).pop(),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            side: BorderSide(
                              color: isDark ? AppColors.neutral700 : AppColors.neutral300,
                              width: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            context.l10n.reEnterDetails,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: primaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: _isSaving
                              ? null
                              : () async {
                                  setModalState(() => _isSaving = true);
                                  setState(() => _isSaving = true);
                                  Navigator.of(modalContext).pop();
                                  await _saveAccount(result);
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary500,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            context.l10n.confirmAndSave,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.5.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGPayMetaRow({
    required BuildContext context,
    required String label,
    required String value,
    bool isHighlighted = false,
    required bool isDark,
  }) {
    final primaryColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedColor = isDark ? AppColors.neutral400 : AppColors.neutral500;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: mutedColor,
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isHighlighted ? (isDark ? Colors.white : AppColors.primary500) : primaryColor,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w600,
              fontSize: 13.5.sp,
            ),
          ),
        ),
      ],
    );
  }

  String _maskAccountNumber(String accountNo) {
    if (accountNo.length <= 4) return accountNo;
    final lastFour = accountNo.substring(accountNo.length - 4);
    return '•••• •••• $lastFour';
  }

  Future<void> _saveAccount(BankAccountVerificationData verifiedData) async {
    setState(() {
      _isSaving = true;
    });

    try {
      final officialName = (verifiedData.nameAtBank?.isNotEmpty ?? false)
          ? verifiedData.nameAtBank!.trim()
          : _holderNameController.text.trim();

      final Map<String, dynamic> data = {
        'type': 'BankAccount',
        'accountHolderName': officialName,
        'bankName': verifiedData.bankName ?? 'Bank Account',
        'accountNumber': _accountNoController.text.trim(),
        'ifscCode': _ifscController.text.trim().toUpperCase(),
      };

      if (_isEditMode) {
        await ref.read(bankAccountsControllerProvider.notifier).updateBankAccount(
              accountId: widget.accountId!,
              accountData: data,
            );
        if (mounted) {
          AppSnackbar.showSuccess(
            context: context,
            message: context.l10n.accountUpdatedSuccess,
          );
        }
      } else {
        await ref.read(bankAccountsControllerProvider.notifier).addBankAccount(data);
        if (mounted) {
          AppSnackbar.showSuccess(
            context: context,
            message: context.l10n.accountAddedSuccess,
          );
        }
      }

      if (mounted) {
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        AppSnackbar.showError(
          context: context,
          message: e.toString().replaceAll('Exception:', '').trim(),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final cardBg = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          _isEditMode ? context.l10n.editBankAccount : context.l10n.addBankAccount,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false, // Handled with explicit bottom padding to protect against system nav bar
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),

                      // Security / Instant Verification Info Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isDark
                                ? [
                                    const Color(0xFF1E1B4B).withValues(alpha: 0.6),
                                    const Color(0xFF312E81).withValues(alpha: 0.4),
                                  ]
                                : [
                                    const Color(0xFFEEF2FF),
                                    const Color(0xFFE0E7FF),
                                  ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6366F1).withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.shield_rounded,
                                color: const Color(0xFF6366F1),
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.l10n.instantVerification,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: isDark ? Colors.white : const Color(0xFF312E81),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    context.l10n.instantVerificationDesc,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: isDark
                                          ? AppColors.neutral300
                                          : const Color(0xFF4338CA),
                                      fontSize: 12.sp,
                                      height: 1.35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animate().fade(duration: 350.ms).slideY(begin: -0.08, end: 0),

                      SizedBox(height: 20.h),

                      // Form Container
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Account Holder Name (with clear helper bracket in label)
                            _buildModernField(
                              controller: _holderNameController,
                              label: 'Account Holder Name',
                              labelSubtitle: '(as on bank account)',
                              hintText: context.l10n.accountHolderNameHint,
                              prefixIcon: Icons.person_outline_rounded,
                              isDark: isDark,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.l10n.fieldRequired;
                                }
                                if (value.trim().length < 2) {
                                  return context.l10n.nameMinLengthRequired;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),

                            // Bank Registered Phone Number
                            _buildModernField(
                              controller: _phoneController,
                              label: context.l10n.bankRegisteredPhone,
                              labelSubtitle: '(linked with bank)',
                              hintText: context.l10n.bankRegisteredPhoneHint,
                              prefixIcon: Icons.phone_android_rounded,
                              isDark: isDark,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.l10n.fieldRequired;
                                }
                                if (value.trim().length != 10) {
                                  return context.l10n.invalidPhoneNumber;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),

                            // Account Number
                            _buildModernField(
                              controller: _accountNoController,
                              label: context.l10n.accountNumber,
                              hintText: context.l10n.enterAccountNumber,
                              prefixIcon: Icons.credit_card_rounded,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(18),
                              ],
                              obscureText: _obscureAccountNo,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureAccountNo
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: mutedTextColor,
                                  size: 20.sp,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureAccountNo = !_obscureAccountNo;
                                  });
                                },
                              ),
                              isDark: isDark,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.l10n.fieldRequired;
                                }
                                if (value.trim().length < 9) {
                                  return context.l10n.invalidAccountNumber;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),

                            // Confirm Account Number
                            _buildModernField(
                              controller: _confirmAccountNoController,
                              label: context.l10n.confirmAccountNumber,
                              hintText: context.l10n.confirmAccountNumberHint,
                              prefixIcon: Icons.lock_outline_rounded,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(18),
                              ],
                              obscureText: _obscureConfirmAccountNo,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmAccountNo
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: mutedTextColor,
                                  size: 20.sp,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmAccountNo = !_obscureConfirmAccountNo;
                                  });
                                },
                              ),
                              isDark: isDark,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.l10n.fieldRequired;
                                }
                                if (value.trim() != _accountNoController.text.trim()) {
                                  return context.l10n.accountNumbersDoNotMatch;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),

                            // IFSC Code
                            _buildModernField(
                              controller: _ifscController,
                              label: context.l10n.ifscCode,
                              hintText: context.l10n.ifscCodeHint,
                              prefixIcon: Icons.account_balance_outlined,
                              textCapitalization: TextCapitalization.characters,
                              characterMaxLimit: 11,
                              isDark: isDark,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                                LengthLimitingTextInputFormatter(11),
                              ],
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.l10n.fieldRequired;
                                }
                                if (value.trim().length != 11) {
                                  return context.l10n.invalidIfsc;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ).animate().fade(duration: 400.ms, delay: 100.ms).slideY(begin: 0.08, end: 0),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),

            // Submit Button Section - Protected against Android System Navigation Bar
            Container(
              padding: EdgeInsets.fromLTRB(
                20.w,
                14.h,
                20.w,
                bottomInset > 0 ? bottomInset + 8.h : 16.h,
              ),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface00,
                border: Border(
                  top: BorderSide(
                    color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: (_isVerifying || _isSaving) ? null : _handleVerificationAndSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    disabledBackgroundColor:
                        isDark ? AppColors.neutral800 : AppColors.neutral300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: (_isVerifying || _isSaving)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.r,
                              height: 20.r,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.2,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              _isVerifying
                                  ? context.l10n.verifyingBankDetails
                                  : context.l10n.confirmAndSave,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline_rounded, color: Colors.white, size: 20.sp),
                            SizedBox(width: 8.w),
                            Text(
                              context.l10n.verifyBankAccount,
                              style: AppTextStyles.titleMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.5.sp,
                              ),
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

  Widget _buildModernField({
    required TextEditingController controller,
    required String label,
    String? labelSubtitle,
    required String hintText,
    required IconData prefixIcon,
    required bool isDark,
    Widget? suffixIcon,
    bool obscureText = false,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    int? characterMaxLimit,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final containerBg = isDark ? AppColors.neutral900 : AppColors.neutral50;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: primaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
            if (labelSubtitle != null) ...[
              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  labelSubtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isDark ? AppColors.neutral400 : AppColors.neutral500,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.5.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          obscureText: obscureText,
          maxLength: characterMaxLimit,
          textCapitalization: textCapitalization,
          style: AppTextStyles.bodyMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.5.sp,
            letterSpacing: 0.3,
          ),
          buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: isDark ? AppColors.neutral500 : AppColors.neutral400,
              fontWeight: FontWeight.w400,
              fontSize: 13.5.sp,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: isDark ? AppColors.neutral400 : AppColors.neutral500,
              size: 20.sp,
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: containerBg,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: isDark ? AppColors.neutral800 : AppColors.neutral200,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: isDark ? AppColors.neutral800 : AppColors.neutral200,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: AppColors.primary500,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: AppColors.errorLight,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: AppColors.errorLight,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
