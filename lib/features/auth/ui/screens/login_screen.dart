import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/locale_provider.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/app_otp_field.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../providers/login_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/network/company_bucket_url.dart';
import '../../../account/providers/company_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneFormKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      setState(() {});
    });
    _logAppSignature();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final state = ref.read(loginControllerProvider);
        if (state.phone.isEmpty || !state.otpSent) {
          ref.read(loginControllerProvider.notifier).resetState();
        }
      }
    });
  }

  void _logAppSignature() async {
    final signature = await SmsAutoFill().getAppSignature;
    Logger().i('App Signature for SMS Auto-Fill: $signature');
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // ══════════════════════════════════════════
  // ACTIONS
  // ══════════════════════════════════════════

  Future<void> _openTdsDeclaration() async {
    try {
      final company = await ref.read(companyControllerProvider.future);
      final rawPath = company.tdsDeclaration;
      if (rawPath != null && rawPath.isNotEmpty) {
        final fullUrl = CompanyBucketUrl.getImageUrl(rawPath);
        final uri = Uri.parse(fullUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      } else {
        if (mounted) {
          AppSnackBar.show(
            context,
            message: 'TDS Declaration document is not available',
            type: SnackBarType.warning,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        AppSnackBar.show(
          context,
          message: 'Error opening TDS Declaration: $e',
          type: SnackBarType.error,
        );
      }
    }
  }

  void _handleSendOtp(LoginState state) async {
    if (!_phoneFormKey.currentState!.validate()) return;

    final isPhoneValid = _validatePhone(_phoneController.text) == null;
    if (!state.termsAccepted || !state.tdsAccepted || !isPhoneValid) {
      return;
    }

    final errorMsg = await ref
        .read(loginControllerProvider.notifier)
        .sendOtp(_phoneController.text.trim());

    if (errorMsg != null && mounted) {
      AppSnackBar.show(context, message: errorMsg, type: SnackBarType.error);
    }
  }

  void _handleVerifyOtp(LoginState state) async {
    if (state.isLoading) return;
    if (state.enteredOtp.length < 4) {
      AppSnackBar.show(
        context,
        message: context.l10n.enterCompleteOtpError,
        type: SnackBarType.warning,
      );
      return;
    }

    final (success, errorMsg, overallStatus) = await ref
        .read(loginControllerProvider.notifier)
        .verifyOtp();

    if (success && mounted) {
      if (overallStatus == 'approved') {
        context.go('/home');
      } else if (overallStatus == 'action_required' || overallStatus == 'pending_review') {
        context.go('/verification');
      } else {
        context.go(
          '/onboarding?phone=${Uri.encodeComponent(_phoneController.text.trim())}',
        );
      }
    } else if (mounted && errorMsg != null) {
      AppSnackBar.show(context, message: errorMsg, type: SnackBarType.error);
    }
  }

  void _handleResendOtp(LoginState state) async {
    if (state.resendCountdown > 0) return;

    final errorMsg = await ref
        .read(loginControllerProvider.notifier)
        .resendOtp(_phoneController.text.trim());

    if (mounted) {
      if (errorMsg == null) {
        AppSnackBar.show(
          context,
          message: context.l10n.otpResentSuccess,
          type: SnackBarType.success,
        );
      } else {
        AppSnackBar.show(context, message: errorMsg, type: SnackBarType.error);
      }
    }
  }

  // ══════════════════════════════════════════
  // BUILD
  // ══════════════════════════════════════════

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(loginControllerProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.space24,
            ),
            child: AnimatedSwitcher(
              duration: AppDimensions.durationNormal,
              child: state.otpSent
                  ? _buildOtpView(theme, isDark, state)
                  : _buildPhoneView(theme, isDark, state),
            ),
          ),
        ),
      ),
    );
  }

  // ══════════════════════════════════════════
  // PHONE NUMBER VIEW
  // ══════════════════════════════════════════

  Widget _buildPhoneView(ThemeData theme, bool isDark, LoginState state) {
    final isPhoneValid = _validatePhone(_phoneController.text) == null;
    final isSendActive =
        state.termsAccepted && state.tdsAccepted && isPhoneValid;

    return Column(
      key: const ValueKey('phone_view'),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(
          theme,
          isDark,
          title: context.l10n.welcome,
          subtitle: context.l10n.enterMobileNumberToContinue,
        ),
        const SizedBox(height: AppDimensions.space48),

        // ── Phone Number Input ──
        AutofillGroup(
          child: Form(
            key: _phoneFormKey,
            child: AppTextField(
              label: context.l10n.mobileNumber,
              hint: '0000000000',
              controller: _phoneController,
              prefixIcon: Icons.phone_outlined,
              prefix: Text(
                '+91  ',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autofillHints: const [AutofillHints.telephoneNumber],
              onFieldSubmitted: (_) => _handleSendOtp(state),
              validator: _validatePhone,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.space16),

        // ── Terms Checkbox ──
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: state.termsAccepted,
                onChanged: (val) {
                  ref
                      .read(loginControllerProvider.notifier)
                      .setTermsAccepted(val ?? false);
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                activeColor: AppColors.primary500,
              ),
            ),
            const SizedBox(width: AppDimensions.space12),
            Expanded(
              child: () {
                final l10n = context.l10n;
                final linkStyle = TextStyle(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                );
                final normalStyle = theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                );

                return Text.rich(
                  TextSpan(
                    style: normalStyle,
                    children: [
                      if (l10n.iAgreeTo.isNotEmpty) TextSpan(text: l10n.iAgreeTo),
                      TextSpan(
                        text: l10n.termsOfService,
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/terms_conditions'),
                      ),
                      if (l10n.and.isNotEmpty) TextSpan(text: l10n.and),
                      TextSpan(
                        text: l10n.privacyPolicy,
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/privacy_policy'),
                      ),
                      if (l10n.agreeSuffix.isNotEmpty)
                        TextSpan(text: l10n.agreeSuffix),
                    ],
                  ),
                );
              }(),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.space12),

        // ── TDS Declaration Checkbox ──
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: state.tdsAccepted,
                onChanged: (val) {
                  ref
                      .read(loginControllerProvider.notifier)
                      .setTdsAccepted(val ?? false);
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                activeColor: AppColors.primary500,
              ),
            ),
            const SizedBox(width: AppDimensions.space12),
            Expanded(
              child: () {
                final l10n = context.l10n;
                final linkStyle = TextStyle(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                );
                final normalStyle = theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                );

                return Text.rich(
                  TextSpan(
                    style: normalStyle,
                    children: [
                      TextSpan(text: l10n.iHaveReadAndConsent),
                      TextSpan(
                        text: l10n.tdsDeclaration,
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = _openTdsDeclaration,
                      ),
                    ],
                  ),
                );
              }(),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.space32),

        // ── Send OTP Button ──
        AppButton(
          label: context.l10n.sendOtp,
          onPressed: isSendActive ? () => _handleSendOtp(state) : null,
          isLoading: state.isLoading,
        ),
      ],
    );
  }

  // ══════════════════════════════════════════
  // OTP VERIFICATION VIEW
  // ══════════════════════════════════════════

  Widget _buildOtpView(ThemeData theme, bool isDark, LoginState state) {
    return Column(
      key: const ValueKey('otp_view'),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(
          theme,
          isDark,
          title: context.l10n.verifyOtp,
          subtitle: context.l10n.enterOtpSentTo(_phoneController.text.trim()),
        ),
        const SizedBox(height: AppDimensions.space48),

        // ── OTP Input ──
        AppOtpField(
          length: 4,
          onCompleted: (otp) {
            ref.read(loginControllerProvider.notifier).setOtp(otp);
            _handleVerifyOtp(ref.read(loginControllerProvider));
          },
          onChanged: (otp) {
            ref.read(loginControllerProvider.notifier).setOtp(otp);
          },
        ),
        const SizedBox(height: AppDimensions.space32),

        // ── Verify Button ──
        AppButton(
          label: context.l10n.verifyAndContinue,
          onPressed: () => _handleVerifyOtp(state),
          isLoading: state.isLoading,
        ),
        const SizedBox(height: AppDimensions.space24),

        // ── Resend / Change Number ──
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: state.resendCountdown > 0
                  ? null
                  : () => _handleResendOtp(state),
              child: Text(
                state.resendCountdown > 0
                    ? context.l10n.resendInSeconds(state.resendCountdown)
                    : context.l10n.resendOtp,
              ),
            ),
            Container(
              width: 1,
              height: 16,
              color: isDark ? AppColors.neutral700 : AppColors.neutral300,
            ),
            TextButton(
              onPressed: () {
                ref.read(loginControllerProvider.notifier).goBackToPhone();
              },
              child: Text(context.l10n.changeNumber),
            ),
          ],
        ),
      ],
    );
  }

  // ══════════════════════════════════════════
  // SHARED BUILDERS
  // ══════════════════════════════════════════

  Widget _buildHeader(
    ThemeData theme,
    bool isDark, {
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        // App Logo / Icon
        Image.asset('assets/images/reachu_logo.png', fit: BoxFit.cover),
        const SizedBox(height: AppDimensions.space24),
        Text(title, style: theme.textTheme.headlineMedium),
        const SizedBox(height: AppDimensions.space8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════
  // VALIDATORS
  // ══════════════════════════════════════════

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.mobileNumberRequired;
    }
    final digitsOnly = value.trim().replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length != 10) {
      return context.l10n.enterValidMobileNumber;
    }
    return null;
  }
}
