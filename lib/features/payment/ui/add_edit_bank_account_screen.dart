import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/utils/app_snackbar.dart';
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
  final _bankNameController = TextEditingController();
  final _accountNoController = TextEditingController();
  final _confirmAccountNoController = TextEditingController();
  final _ifscController = TextEditingController();
  final _upiController = TextEditingController();

  String _selectedType = 'BankAccount'; // 'BankAccount' or 'UPI'
  bool _isEditMode = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.accountId != null;
    if (_isEditMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _populateFields();
      });
    }
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
      _selectedType = account.type;
      _holderNameController.text = account.accountHolderName ?? '';
      _bankNameController.text = account.bankName ?? '';
      _accountNoController.text = account.accountNumber ?? '';
      _confirmAccountNoController.text = account.accountNumber ?? '';
      _ifscController.text = account.ifscCode ?? '';
      _upiController.text = account.upiId ?? '';
    });
  }

  @override
  void dispose() {
    _holderNameController.dispose();
    _bankNameController.dispose();
    _accountNoController.dispose();
    _confirmAccountNoController.dispose();
    _ifscController.dispose();
    _upiController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final Map<String, dynamic> data = {
        'type': _selectedType,
        'accountHolderName': _holderNameController.text.trim(),
      };

      if (_selectedType == 'BankAccount') {
        data['bankName'] = _bankNameController.text.trim();
        data['accountNumber'] = _accountNoController.text.trim();
        data['ifscCode'] = _ifscController.text.trim().toUpperCase();
      } else {
        data['upiId'] = _upiController.text.trim();
      }

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
          message: e.toString(),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

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
          _isEditMode
              ? (_selectedType == 'BankAccount'
                  ? context.l10n.editBankAccount
                  : context.l10n.editUpiId)
              : context.l10n.addAccount,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),

                      // Segment Selector for Bank Account vs UPI (only in add mode)
                      if (!_isEditMode) ...[
                        Container(
                          width: double.infinity,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.darkSurface02 : AppColors.neutral100,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedType = 'BankAccount';
                                    });
                                  },
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Container(
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: _selectedType == 'BankAccount'
                                          ? AppColors.primary500
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Text(
                                      context.l10n.bankAccounts.split(" ").first,
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: _selectedType == 'BankAccount'
                                            ? Colors.white
                                            : primaryTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedType = 'UPI';
                                    });
                                  },
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Container(
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: _selectedType == 'UPI'
                                          ? AppColors.primary500
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Text(
                                      context.l10n.upi,
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: _selectedType == 'UPI'
                                            ? Colors.white
                                            : primaryTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                      ],

                      // Common Input: Account Holder Name
                      _buildTextField(
                        controller: _holderNameController,
                        label: context.l10n.accountHolderName,
                        hintText: context.l10n.enterAccountHolderName,
                        isDark: isDark,
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
                      SizedBox(height: 20.h),

                      // Dynamic Fields based on Type Selection
                      if (_selectedType == 'BankAccount') ...[
                        _buildTextField(
                          controller: _bankNameController,
                          label: context.l10n.bankName,
                          hintText: context.l10n.bankNameHint,
                          isDark: isDark,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.l10n.fieldRequired;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        _buildTextField(
                          controller: _accountNoController,
                          label: context.l10n.accountNumber,
                          hintText: context.l10n.enterAccountNumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        SizedBox(height: 20.h),
                        _buildTextField(
                          controller: _confirmAccountNoController,
                          label: context.l10n.confirmAccountNumber,
                          hintText: context.l10n.confirmAccountNumberHint,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        SizedBox(height: 20.h),
                        _buildTextField(
                          controller: _ifscController,
                          label: context.l10n.ifscCode,
                          hintText: context.l10n.ifscCodeHint,
                          characterMaxLimit: 11,
                          textCapitalization: TextCapitalization.characters,
                          isDark: isDark,
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
                      ] else ...[
                        _buildTextField(
                          controller: _upiController,
                          label: context.l10n.upiId,
                          hintText: context.l10n.upiIdHint,
                          isDark: isDark,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.l10n.fieldRequired;
                            }
                            final regex = RegExp(r'^[\w.-]+@[\w.-]+$');
                            if (!regex.hasMatch(value.trim())) {
                              return context.l10n.invalidUpi;
                            }
                            return null;
                          },
                        ),
                      ],
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),

            // Submit Button Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface00,
                border: Border(
                  top: BorderSide(
                    color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    disabledBackgroundColor: isDark ? AppColors.neutral800 : AppColors.neutral300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : Text(
                          context.l10n.done,
                          style: AppTextStyles.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required bool isDark,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    int? characterMaxLimit,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final containerBg = isDark ? AppColors.darkSurface02 : AppColors.lightSurface02;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          maxLength: characterMaxLimit,
          textCapitalization: textCapitalization,
          style: AppTextStyles.bodyLarge.copyWith(color: primaryTextColor),
          buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyLarge.copyWith(
              color: isDark ? AppColors.neutral600 : AppColors.neutral400,
            ),
            filled: true,
            fillColor: containerBg,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: isDark ? AppColors.neutral800 : AppColors.neutral200,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: isDark ? AppColors.neutral800 : AppColors.neutral200,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppColors.primary500,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppColors.errorLight,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
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
