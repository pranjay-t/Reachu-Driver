import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:reachu_driver/l10n/app_localizations.dart';
import 'package:reachu_driver/shared/widgets/network_status_banner.dart';
import '../../../core/network/maintenance_update_provider.dart';
import '../../../app/theme/app_colors.dart';

/// A guard widget that wraps the app and displays a blocking screen
/// if the app is under maintenance or if a force update is required.
class ForceUpdateAndMaintenanceGuard extends ConsumerStatefulWidget {
  final Widget child;

  const ForceUpdateAndMaintenanceGuard({super.key, required this.child});

  @override
  ConsumerState<ForceUpdateAndMaintenanceGuard> createState() =>
      _ForceUpdateAndMaintenanceGuardState();
}

class _ForceUpdateAndMaintenanceGuardState
    extends ConsumerState<ForceUpdateAndMaintenanceGuard> {
  String _currentVersion = '1.0.0';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initVersionInfo();
  }

  Future<void> _initVersionInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      if (mounted) {
        setState(() {
          _currentVersion = packageInfo.version;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  bool _isVersionLessThan(String current, String requiredVersion) {
    try {
      // Strip build number (e.g. 1.0.0+1 -> 1.0.0)
      final currentClean = current.split('+')[0];
      final requiredClean = requiredVersion.split('+')[0];

      final currentParts = currentClean.split('.').map(int.parse).toList();
      final requiredParts = requiredClean.split('.').map(int.parse).toList();

      final maxLength = currentParts.length > requiredParts.length
          ? currentParts.length
          : requiredParts.length;

      for (var i = 0; i < maxLength; i++) {
        final currentVal = i < currentParts.length ? currentParts[i] : 0;
        final requiredVal = i < requiredParts.length ? requiredParts[i] : 0;

        if (currentVal < requiredVal) return true;
        if (currentVal > requiredVal) return false;
      }
      return false;
    } catch (e) {
      // If parsing fails, default to not blocking
      return false;
    }
  }

  Future<void> _launchStore() async {
    final l10n = AppLocalizations.of(context);
    final Uri url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.reachu.driver',
    );
    try {
      if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
        // Success
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n?.couldNotOpenStore ??
                  'Could not open Play Store. Please update manually.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildFlexibleUpdateOverlay(String newVersion) {
    final l10n = AppLocalizations.of(context);

    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Semi-transparent background barrier
            GestureDetector(
              onTap: () {
                ref
                    .read(maintenanceUpdateProvider.notifier)
                    .dismissFlexiblePrompt();
              },
              child: Container(color: Colors.black.withValues(alpha: 0.6)),
            ).animate().fadeIn(duration: 250.ms),

            // Bottom sheet container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B), // Slate 800
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(24),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Premium glow update icon
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primary500.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.rocket_launch_rounded,
                          size: 48,
                          color: AppColors.primary400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n?.newUpdateAvailable ?? 'New Update Available!',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Outfit',
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'A new version (v$newVersion) of Reachu is available with exciting new features and performance enhancements. You can continue using the app or update now.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.white.withValues(alpha: 0.7),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                ref
                                    .read(maintenanceUpdateProvider.notifier)
                                    .dismissFlexiblePrompt();
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white.withValues(
                                  alpha: 0.7,
                                ),
                                side: BorderSide(
                                  color: Colors.white.withValues(alpha: 0.15),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(l10n?.updateLater ?? 'LATER'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(maintenanceUpdateProvider.notifier)
                                    .dismissFlexiblePrompt();
                                _launchStore();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary500,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(l10n?.updateNow ?? 'UPDATE NOW'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ).animate().slideY(
              begin: 1.0,
              end: 0.0,
              duration: 300.ms,
              curve: Curves.easeOutCubic,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final cacheState = ref.watch(maintenanceUpdateProvider);
    Widget activeView;

    // 1. Show Maintenance screen if maintenanceStatus is true
    if (cacheState.maintenanceStatus) {
      activeView = _buildMaintenanceScreen(cacheState.maintenanceEndTime);
    } else {
      // 2. Show forced update screen if updateStatus is FORCED and version is outdated
      final appVersion = cacheState.appVersion;
      final isForcedUpdateRequired =
          cacheState.updateStatus == UpdateStatus.forced &&
          appVersion != null &&
          _isVersionLessThan(_currentVersion, appVersion);

      if (isForcedUpdateRequired) {
        activeView = _buildUpdateScreen(appVersion);
      } else {
        // 3. Determine if we should show the flexible update prompt
        final showFlexiblePrompt =
            cacheState.updateStatus == UpdateStatus.flexible &&
            !cacheState.hasPromptedFlexibleUpdate &&
            appVersion != null &&
            _isVersionLessThan(_currentVersion, appVersion);

        activeView = Stack(
          children: [
            widget.child,
            if (showFlexiblePrompt) _buildFlexibleUpdateOverlay(appVersion),
          ],
        );
      }
    }

    // Wrap the entire app screen with NetworkStatusBanner so alerts float seamlessly
    return NetworkStatusBanner(child: activeView);
  }

  Widget _buildMaintenanceScreen(String? endTime) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A), // Slate 900
              Color(0xFF1E293B), // Slate 800
              Color(0xFF0F172A), // Slate 900
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Beautiful Animated Icon
                Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFF59E0B,
                        ).withValues(alpha: 0.1), // Amber
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFF59E0B).withValues(alpha: 0.2),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.construction_rounded,
                        size: 80,
                        color: Color(0xFFF59E0B),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .shimmer(
                      duration: 1800.ms,
                      color: Colors.white.withValues(alpha: 0.3),
                    )
                    .scale(
                      begin: const Offset(0.95, 0.95),
                      end: const Offset(1.05, 1.05),
                      duration: 1500.ms,
                      curve: Curves.easeInOut,
                    ),

                const SizedBox(height: 40),

                // Header
                Text(
                  l10n?.underMaintenanceTitle ?? 'Under Maintenance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),

                const SizedBox(height: 16),

                // Description
                Text(
                      l10n?.underMaintenanceDesc ??
                          'We are currently performing scheduled maintenance to upgrade our system. We will be back online soon.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.7),
                        height: 1.5,
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                if (endTime != null) ...[
                  const SizedBox(height: 32),
                  MaintenanceCountdown(endTime: endTime)
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 600.ms)
                      .slideY(begin: 0.2, end: 0),
                ],

                const Spacer(),

                // Bottom Brand Indicator
                Text(
                  'Reachu',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withValues(alpha: 0.4),
                    letterSpacing: 2,
                  ),
                ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateScreen(String requiredVersion) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E1B4B), // Indigo 950
              Color(0xFF0F172A), // Slate 900
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Rocket/Update Icon with premium glow
                Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColors.primary500.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary500.withValues(alpha: 0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary500.withValues(alpha: 0.2),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.rocket_launch_rounded,
                        size: 80,
                        color: AppColors.primary400,
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .scale(
                      begin: const Offset(0.97, 0.97),
                      end: const Offset(1.03, 1.03),
                      duration: 1200.ms,
                      curve: Curves.easeInOut,
                    )
                    .shimmer(
                      duration: 2000.ms,
                      color: Colors.white.withValues(alpha: 0.2),
                    ),

                const SizedBox(height: 40),

                // Header
                Text(
                  l10n?.updateRequiredTitle ?? 'Update Required',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),

                const SizedBox(height: 16),

                // Description
                Text(
                      l10n?.updateRequiredDesc(requiredVersion) ??
                          'A newer, faster, and more secure version of Reachu is available. Please update to version $requiredVersion to continue using the application.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.7),
                        height: 1.5,
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: 48),

                // Update Button
                SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _launchStore,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary500,
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: AppColors.primary500.withValues(alpha: 0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.system_update_rounded),
                            const SizedBox(width: 12),
                            Text(
                              l10n?.updateNow ?? 'UPDATE NOW',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 600.ms)
                    .scaleXY(begin: 0.9, end: 1),

                const Spacer(),

                // App Version info
                Text(
                  l10n?.installedVersion(_currentVersion) ??
                      'Installed Version: $_currentVersion',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Dynamic ticking countdown timer for Scheduled Maintenance.
class MaintenanceCountdown extends StatefulWidget {
  final String endTime;

  const MaintenanceCountdown({super.key, required this.endTime});

  @override
  State<MaintenanceCountdown> createState() => _MaintenanceCountdownState();
}

class _MaintenanceCountdownState extends State<MaintenanceCountdown> {
  Timer? _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _calculateRemaining();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateRemaining() {
    try {
      final end = DateTime.parse(widget.endTime).toLocal();
      final now = DateTime.now();
      final difference = end.difference(now);
      if (mounted) {
        setState(() {
          _remaining = difference.isNegative ? Duration.zero : difference;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _remaining = Duration.zero;
        });
      }
    }
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (_remaining == Duration.zero) {
      return Text(
        l10n?.backOnlineSoon ?? 'We will be back online soon',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white.withValues(alpha: 0.9),
        ),
      );
    }

    return Column(
      children: [
        Text(
          l10n?.estimatedBackIn(_formatDuration(_remaining)) ?? 'ESTIMATED BACK IN',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white.withValues(alpha: 0.5),
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF59E0B).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFF59E0B).withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF59E0B).withValues(alpha: 0.05),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            _formatDuration(_remaining),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF59E0B),
              letterSpacing: 2,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
        ),
      ],
    );
  }
}
