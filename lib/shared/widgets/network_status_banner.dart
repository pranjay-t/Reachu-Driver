import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:reachu_driver/l10n/app_localizations.dart';
import '../../core/network/network_connectivity_provider.dart';
import '../../app/theme/app_colors.dart';

class NetworkStatusBanner extends ConsumerStatefulWidget {
  final Widget child;

  const NetworkStatusBanner({super.key, required this.child});

  @override
  ConsumerState<NetworkStatusBanner> createState() => _NetworkStatusBannerState();
}

class _NetworkStatusBannerState extends ConsumerState<NetworkStatusBanner> {
  Timer? _restoredToastTimer;
  bool _showRestoredToast = false;

  @override
  void dispose() {
    _restoredToastTimer?.cancel();
    super.dispose();
  }

  void _triggerRestoredToast() {
    _restoredToastTimer?.cancel();
    setState(() {
      _showRestoredToast = true;
    });
    _restoredToastTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showRestoredToast = false;
        });
        ref.read(networkConnectivityProvider.notifier).clearWasOfflineFlag();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(networkConnectivityProvider);
    final l10n = AppLocalizations.of(context);

    // Listen for offline -> online transition to trigger 3s green toast
    ref.listen(networkConnectivityProvider, (prev, next) {
      if (prev != null && !prev.isOnline && next.isOnline) {
        _triggerRestoredToast();
      }
    });

    final isOffline = !connectivityState.isOnline;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        widget.child,

        // 1. Offline Red Alert Banner
        if (isOffline)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              elevation: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? AppColors.neutral900 : Colors.red.shade900,
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.errorLight.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 6,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.errorDark.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.wifi_off_rounded,
                        color: AppColors.errorLight,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n?.noInternetConnection ?? 'No Internet Connection',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Outfit',
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            l10n?.checkInternetConnection ??
                                'Please check your mobile data or Wi-Fi connection.',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(networkConnectivityProvider.notifier)
                            .checkConnectivityNow();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary300,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: connectivityState.isChecking
                          ? const SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              l10n?.retryConnection ?? 'Retry',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ).animate().slideY(
                  begin: -1.0,
                  end: 0.0,
                  duration: 300.ms,
                  curve: Curves.easeOutCubic,
                ),
          ),

        // 2. Restored Green Toast Banner
        if (!isOffline && _showRestoredToast)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              elevation: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.successDark,
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 6,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.wifi_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n?.internetRestored ?? 'Internet Connection Restored',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
                .animate()
                .slideY(
                  begin: -1.0,
                  end: 0.0,
                  duration: 250.ms,
                  curve: Curves.easeOutCubic,
                )
                .then(delay: 2500.ms)
                .slideY(
                  begin: 0.0,
                  end: -1.0,
                  duration: 250.ms,
                  curve: Curves.easeInCubic,
                ),
          ),
      ],
    );
  }
}
