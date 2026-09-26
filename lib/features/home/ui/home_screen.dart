import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/localization/locale_provider.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../shared/widgets/app_cached_image.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/permission_gate_popup.dart';
import '../../../../shared/widgets/app_online_toggle.dart';
import '../../../../shared/widgets/low_balance_popup.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../models/home_response.dart';
import '../providers/home_controller.dart';
import '../providers/order_controller.dart';

import 'package:reachu_driver/core/socket/socket_stream_manager.dart';
import 'package:reachu_driver/core/socket/socket_manager_provider.dart';
import 'package:reachu_driver/features/account/providers/profile_controller.dart';
import 'package:reachu_driver/features/booking/providers/ride_queue_provider.dart';
import 'package:reachu_driver/features/tutorials/providers/tutorial_controller.dart';
import 'package:reachu_driver/core/utils/app_logger.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  StreamSubscription? _rideStatusSubscription;
  StreamSubscription? _navigationSubscription;
  DateTime? _lastBackPressTime;
  static bool _hasShownLowBalancePopup = false;

  void _handleDoubleBackToExit() {
    final now = DateTime.now();
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      AppSnackBar.show(
        context,
        message: context.l10n.pressBackAgainToExit,
        type: SnackBarType.info,
      );
    } else {
      SystemNavigator.pop();
    }
  }

  String _getGreeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return context.l10n.goodMorning;
    } else if (hour < 17) {
      return context.l10n.goodAfternoon;
    } else {
      return context.l10n.goodEvening;
    }
  }

  @override
  void initState() {
    super.initState();
    // Refresh stats when home is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      // 1. Refresh home data (which gets driver.isOnline from backend)
      await ref.read(homeControllerProvider.notifier).refreshHome();
      if (!mounted) return;

      // 2. Check if mandatory tutorials are pending
      try {
        final isPending = await ref
            .read(pendingTutorialsProvider.notifier)
            .checkPendingStatus();
        if (!mounted) return;
        if (isPending) {
          context.go('/mandatory_tutorials');
          return;
        }
      } catch (_) {}

      final socketClient = ref.read(socketClientProvider);

      // Check if required permissions are granted
      bool allPermissionsGranted = true;
      if (Platform.isAndroid) {
        final hasLocation = await Permission.locationAlways.isGranted;
        if (!mounted) return;
        final results = await Future.wait([
          Permission.notification.isGranted,
          Permission.systemAlertWindow.isGranted,
        ]);
        if (!mounted) return;
        allPermissionsGranted = hasLocation && results[0] && results[1];
      } else {
        allPermissionsGranted = await Permission.locationAlways.isGranted;
        if (!mounted) return;
      }

      if (!allPermissionsGranted) {
        // Find if they were supposed to be online (local preference or backend)
        final prefs = await SharedPreferences.getInstance();
        if (!mounted) return;
        final wasOnlineLocal = prefs.getBool("driver_is_online") ?? false;

        bool wasOnlineBackend = false;
        final homeState = ref.read(homeControllerProvider);
        if (homeState.hasValue) {
          wasOnlineBackend = homeState.value?.driver.isOnline ?? false;
        }

        final needsOfflineEnforcement = wasOnlineLocal || wasOnlineBackend;

        if (needsOfflineEnforcement) {
          AppLogger.w(
            '⚠️ Location permission missing but driver was online. Enforcing offline state.',
          );

          // Clear local online preference
          await prefs.setBool("driver_is_online", false);

          // Set socket client to offline state
          socketClient.setOfflineState();

          // Sync with backend by making PUT request to update driver isOnline to false
          await ref
              .read(homeControllerProvider.notifier)
              .toggleDutyStatus(false);
          if (!mounted) return;

          // Notify socket server to go offline
          await socketClient.goOffline();
          if (!mounted) return;
        }
      }

      // Dynamic navigation if ride is confirmed/updated/reconnected. Listen early so no connection-time events (like ride:reconnected) are lost!
      _rideStatusSubscription = socketClient.rideStatusStream.listen((
        rideData,
      ) {
        if (mounted) {
          ref
              .read(orderControllerProvider.notifier)
              .handleOrderRedirection(context, rideData);
        }
      });

      // Listen for native notification body clicks and handle redirection to correct routes
      _navigationSubscription = socketClient.navigationStream.listen((route) {
        if (mounted) {
          final currentLocation = GoRouterState.of(context).matchedLocation;
          if (currentLocation != route) {
            AppLogger.d(
              '🚕 [HomeScreen] Redirecting to native notification request route: $route',
            );
            context.push(route);
          }
        }
      });

      // Initialize the socket client (which will see driver_is_online as false and stay offline, or restore online status if permitted)
      await socketClient.initialize();
      if (!mounted) return;

      // Trigger the active order reconnection check
      await ref
          .read(orderControllerProvider.notifier)
          .checkActiveOrder(context);

      // Pre-fetch profile to cache vehicle details in SharedPreferences
      ref
          .read(profileControllerProvider.future)
          .then((_) {
            AppLogger.d('✅ Profile pre-fetched successfully on Home Screen');
          })
          .catchError((e) {
            AppLogger.e('⚠️ Error pre-fetching profile on Home: $e');
          });
    });
  }

  @override
  void dispose() {
    _rideStatusSubscription?.cancel();
    _navigationSubscription?.cancel();
    super.dispose();
  }

  Widget _buildSkeletonLoading(ThemeData theme, bool isDark) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Shimmer.fromColors(
        baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
        highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 24.r, backgroundColor: Colors.white),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.w,
                          height: 12.h,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          width: 120.w,
                          height: 18.h,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(width: 50.w, height: 10.h, color: Colors.white),
                    SizedBox(height: 8.h),
                    Container(
                      width: 44.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Container(
              height: 180.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
              ),
            ),
            SizedBox(height: 32.h),
            Container(
              width: 150.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 125.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMD,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Container(
                    height: 125.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMD,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 125.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMD,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Container(
                    height: 125.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMD,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final homeDataAsync = ref.watch(homeControllerProvider);

    ref.listen<AsyncValue<HomeData>>(homeControllerProvider, (previous, next) {
      next.whenData((homeData) {
        if (homeData.driver.lowBalance && !_hasShownLowBalancePopup) {
          _hasShownLowBalancePopup = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              LowBalancePopup.show(
                context,
                driverWalletLimit: homeData.driver.driverWalletLimit,
              );
            }
          });
        }
      });
    });

    ref.listen<List<RideRequestItem>>(rideQueueProvider, (previous, next) {
      if (next.isNotEmpty && (previous == null || previous.isEmpty)) {
        final currentLocation = GoRouterState.of(context).matchedLocation;
        if (currentLocation != '/ride_request_queue') {
          AppLogger.i(
            '🧾 [HomeScreen] Rides found in queue! Navigating to RideRequestQueueScreen...',
          );
          context.push('/ride_request_queue');
        }
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleDoubleBackToExit();
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary500,
          onRefresh: () =>
              ref.read(homeControllerProvider.notifier).refreshHome(),
          child: homeDataAsync.when(
            loading: () => _buildSkeletonLoading(theme, isDark),
            error: (err, _) => SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 100.h),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_off_rounded,
                      color: AppColors.neutral500,
                      size: 72.r,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.failedToLoadDashboard,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      err.toString(),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    AppButton(
                      label: context.l10n.retry,
                      onPressed: () => ref
                          .read(homeControllerProvider.notifier)
                          .refreshHome(),
                    ),
                  ],
                ),
              ),
            ),
            data: (homeData) {
              final driver = homeData.driver;
              final stats = homeData.todayStats;

              final profileState = ref.watch(profileControllerProvider);
              final profileDriver = profileState.asData?.value;
              final ratingDisplay = profileDriver?.rating?.toStringAsFixed(1) ?? '5.0';

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Header: Profile Info & Duty Switch ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => context.go('/profile'),
                              child:
                                  (driver.image != null &&
                                      driver.image!.isNotEmpty &&
                                      driver.image != 'null')
                                  ? AppCachedImage(
                                      imageUrl: driver.image!,
                                      width: 48.r,
                                      height: 48.r,
                                      borderRadius: BorderRadius.circular(24.r),
                                    )
                                  : CircleAvatar(
                                      radius: 24.r,
                                      backgroundColor: AppColors.primary500
                                          .withValues(alpha: 0.15),
                                      child: const Icon(
                                        Icons.person,
                                        color: AppColors.primary500,
                                      ),
                                    ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getGreeting(context),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: isDark
                                        ? AppColors.darkTextSecondary
                                        : AppColors.lightTextSecondary,
                                  ),
                                ),
                                Text(
                                  driver.name,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Wallet Button and Slide/Switch Toggle for Online/Offline
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => context.push('/payment'),
                              icon: Icon(
                                Icons.account_balance_wallet_rounded,
                                color: AppColors.primary500,
                                size: 22.sp,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: isDark
                                    ? AppColors.darkSurface02
                                    : AppColors.lightSurface02,
                                padding: EdgeInsets.all(8.r),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Consumer(
                              builder: (context, ref, child) {
                                final socketStatus = ref.watch(
                                  socketManagerProvider,
                                );
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      socketStatus.isOnDuty
                                          ? context.l10n.online.toUpperCase()
                                          : context.l10n.offline.toUpperCase(),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: socketStatus.isOnDuty
                                                ? AppColors.successLight
                                                : AppColors.neutral500,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                          ),
                                    ),
                                    SizedBox(height: 6.h),
                                    AppOnlineToggle(
                                      value: socketStatus.isOnDuty,
                                      isProcessing: socketStatus.isProcessing,
                                      onChanged: (val) async {
                                        if (val) {
                                          final allGranted =
                                              await PermissionGatePopup.checkAndShow(
                                                context,
                                              );
                                          if (!mounted) return;
                                          if (!allGranted) return;
                                          await ref
                                              .read(socketClientProvider)
                                              .getInitialLocation();
                                          if (!mounted) return;
                                        }
                                        final success = await ref
                                            .read(
                                              socketManagerProvider.notifier,
                                            )
                                            .toggleDuty(val);
                                        if (!mounted) return;
                                        if (success) {
                                          if (context.mounted) {
                                            AppSnackBar.show(
                                              context,
                                              message: val
                                                  ? context
                                                        .l10n
                                                        .onlineSuccessMessage
                                                  : context
                                                        .l10n
                                                        .offlineSuccessMessage,
                                              type: val
                                                  ? SnackBarType.success
                                                  : SnackBarType.info,
                                            );
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ).animate().fade(duration: 400.ms).slideY(begin: -0.1, end: 0),

                     if (driver.lowBalance) ...[
                       SizedBox(height: 16.h),
                       Container(
                         width: double.infinity,
                         padding: EdgeInsets.all(16.w),
                         decoration: BoxDecoration(
                           color: AppColors.errorSurface.withValues(alpha: isDark ? 0.15 : 0.12),
                           borderRadius: BorderRadius.circular(16.r),
                           border: Border.all(
                             color: AppColors.errorLight.withValues(alpha: 0.4),
                           ),
                         ),
                         child: Row(
                           children: [
                             Icon(
                               Icons.warning_amber_rounded,
                               color: AppColors.errorLight,
                               size: 24.sp,
                             ),
                             SizedBox(width: 12.w),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     context.l10n.lowWalletBalance,
                                     style: theme.textTheme.titleSmall?.copyWith(
                                       color: AppColors.errorLight,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   SizedBox(height: 2.h),
                                   Text(
                                     context.l10n.lowBalanceDashboardWarning(driver.driverWalletLimit.toStringAsFixed(2)),
                                     style: theme.textTheme.bodySmall?.copyWith(
                                       color: isDark ? AppColors.neutral300 : AppColors.neutral700,
                                       fontSize: 11.sp,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(width: 8.w),
                             ElevatedButton(
                               onPressed: () => context.push('/add_money'),
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: AppColors.errorLight,
                                 elevation: 0,
                                 padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                 minimumSize: Size.zero,
                                 tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.r),
                                 ),
                               ),
                               child: Text(
                                 context.l10n.addMoney,
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 11.sp,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],

                     SizedBox(height: 28.h),

                    // ── PREMIUM GRADIENT CARD: TODAY'S EARNINGS ──
                    GestureDetector(
                      onTap: () => context.push('/payment'),
                      child: Container(
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.primary500,
                              AppColors.primary800,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusLG,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary500.withValues(
                                alpha: 0.35,
                              ),
                              blurRadius: 16,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  context.l10n.todaysEarnings,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "₹${stats.earnings.total.toStringAsFixed(2)}",
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              height: 1,
                              color: Colors.white.withValues(alpha: 0.15),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n.cashCollected.toUpperCase(),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: Colors.white.withValues(
                                              alpha: 0.6,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "₹${stats.earnings.cash.toStringAsFixed(2)}",
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n.onlinePayment.toUpperCase(),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: Colors.white.withValues(
                                              alpha: 0.6,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "₹${stats.earnings.online.toStringAsFixed(2)}",
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ).animate().scale(delay: 100.ms, duration: 400.ms),

                    SizedBox(height: 32.h),

                    Text(
                      context.l10n.todaysRideStatus,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // ── ORDER STATS GRID ──
                    Row(
                      children: [
                        Expanded(
                          child: _buildMetricCard(
                            theme: theme,
                            isDark: isDark,
                            title: context.l10n.totalRides,
                            value: '${stats.rides.total}',
                            icon: Icons.inventory_2_rounded,
                            iconColor: AppColors.primary500,
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: _buildMetricCard(
                            theme: theme,
                            isDark: isDark,
                            title: context.l10n.completed,
                            value: '${stats.rides.completed}',
                            icon: Icons.check_circle_rounded,
                            iconColor: AppColors.successLight,
                          ),
                        ),
                      ],
                    ).animate().slideY(delay: 200.ms, begin: 0.1, end: 0),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildMetricCard(
                            theme: theme,
                            isDark: isDark,
                            title: context.l10n.cancelled,
                            value: '${stats.rides.cancelled}',
                            icon: Icons.cancel_rounded,
                            iconColor: AppColors.errorLight,
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: _buildMetricCard(
                            theme: theme,
                            isDark: isDark,
                            title: context.l10n.dutyRating,
                            value: '$ratingDisplay ★',
                            icon: Icons.star_rounded,
                            iconColor: Colors.amber,
                            onTap: () => context.push('/profile/rating'),
                            trailingWidget: Icon(
                              Icons.chevron_right_rounded,
                              size: 18.sp,
                              color: isDark ? AppColors.neutral400 : AppColors.neutral500,
                            ),
                          ),
                        ),
                      ],
                    ).animate().slideY(delay: 300.ms, begin: 0.1, end: 0),

                    SizedBox(height: 100.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildMetricCard({
    required ThemeData theme,
    required bool isDark,
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    VoidCallback? onTap,
    Widget? trailingWidget,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface02 : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: (isDark ? AppColors.neutral800 : AppColors.neutral200)
              .withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Icon(icon, color: iconColor, size: 22.sp),
                    ),
                    ?trailingWidget,
                  ],
                ),
                SizedBox(height: 14.h),
                Text(
                  value,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 22.sp,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
