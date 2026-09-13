import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:reachu_driver/core/utils/screen_safe_extensions.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../models/onboarding_enums.dart';
import '../../providers/verification_controller.dart';
import '../../providers/login_controller.dart';
import 'action_required_screen.dart';

class VerificationStatusScreen extends ConsumerStatefulWidget {
  const VerificationStatusScreen({super.key});

  @override
  ConsumerState<VerificationStatusScreen> createState() =>
      _VerificationStatusScreenState();
}

class _VerificationStatusScreenState
    extends ConsumerState<VerificationStatusScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkStatus();
    });
  }

  Future<void> _checkStatus() async {
    await ref
        .read(verificationControllerProvider.notifier)
        .checkVerification('');
  }

  Widget _buildStatusContent(String status, ThemeData theme, bool isDark) {
    switch (status) {
      case OverallStatus.actionRequired:
      case 'rejected':
        return const ActionRequiredScreen();

      case OverallStatus.approved:
      case 'verified':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.space24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.successLight.withValues(alpha: 0.15),
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.successLight,
                size: 80,
              ),
            ).animate().scale(duration: 400.ms),
            const SizedBox(height: AppDimensions.space32),
            Text(
              'Application Approved!',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.successLight,
              ),
            ),
            const SizedBox(height: AppDimensions.space12),
            Text(
              'Redirecting you to the home dashboard...',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ],
        );

      case OverallStatus.notStarted:
      case OverallStatus.inProgress:
      case 'draft':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.space24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.warningLight.withValues(alpha: 0.15),
              ),
              child: const Icon(
                Icons.edit_document,
                color: AppColors.warningLight,
                size: 80,
              ),
            ),
            const SizedBox(height: AppDimensions.space32),
            Text(
              'Complete Registration',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.space12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.wSafe),
              child: Text(
                'Your profile is currently incomplete. Please click the button below to finish registering.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.space48),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.wSafe),
              child: AppButton(
                label: 'Finish Registration',
                onPressed: () {
                  context.pushReplacement('/onboarding');
                },
              ),
            ),
          ],
        );

      case OverallStatus.pendingReview:
      case 'pending':
      default:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 140.rSafe,
                  height: 140.rSafe,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: AppColors.primary500,
                    backgroundColor: isDark
                        ? AppColors.darkSurface03
                        : AppColors.lightSurface03,
                  ),
                ),
                Icon(
                      Icons.hourglass_empty_rounded,
                      color: AppColors.primary400,
                      size: 56.rSafe,
                    )
                    .animate(onPlay: (controller) => controller.repeat())
                    .rotate(duration: 2.seconds),
              ],
            ),
            const SizedBox(height: AppDimensions.space40),
            Text(
              'Verification in Progress',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.space12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.wSafe),
              child: Text(
                'Our admin team is currently reviewing your documents and vehicle details. This process typically takes up to 24 hours.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.space8),
            Text(
              'Click check verification below to fetch updates.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.neutral500,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: AppDimensions.space48),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.wSafe),
              child: AppButton(
                label: 'Check Verification',
                onPressed: _checkStatus,
              ),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final statusAsync = ref.watch(verificationControllerProvider);

    return statusAsync.when(
      data: (status) {
        if (status == OverallStatus.actionRequired || status == 'rejected') {
          return const ActionRequiredScreen();
        }

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text('Account Verification'),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout_rounded),
                tooltip: 'Logout',
                onPressed: () async {
                  await ref.read(loginControllerProvider.notifier).logout();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: _buildStatusContent(
                          status ?? OverallStatus.pendingReview,
                          theme,
                          isDark,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () => Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Account Verification'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: AppColors.primary500,
              ),
              SizedBox(height: 16),
              Text(
                'Checking status...',
                style: TextStyle(color: AppColors.neutral500),
              ),
            ],
          ),
        ),
      ),
      error: (error, _) => Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Account Verification'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              tooltip: 'Logout',
              onPressed: () async {
                await ref.read(loginControllerProvider.notifier).logout();
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wifi_off_rounded,
                color: Colors.orange,
                size: 64,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.wSafe,
                ),
                child: Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.wSafe,
                ),
                child: AppButton(
                  label: 'Try Again',
                  onPressed: _checkStatus,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
