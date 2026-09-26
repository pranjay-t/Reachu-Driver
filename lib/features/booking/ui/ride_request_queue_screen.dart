import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/localization/locale_provider.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/socket/socket_stream_manager.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../providers/ride_queue_provider.dart';
import '../../home/providers/order_controller.dart';
import '../../../core/utils/ride_sound_service.dart';
import 'widgets/ride_request_card.dart';

class RideRequestQueueScreen extends ConsumerStatefulWidget {
  const RideRequestQueueScreen({super.key});

  @override
  ConsumerState<RideRequestQueueScreen> createState() => _RideRequestQueueScreenState();
}

class _RideRequestQueueScreenState extends ConsumerState<RideRequestQueueScreen> {
  String? _acceptingOrderId;
  bool _isProcessing = false;
  Timer? _emptyQueueFallbackTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Immediately load any pending ride stored in SharedPreferences
      ref.read(rideQueueProvider.notifier).loadPendingRideFromPrefs();

      // If queue remains empty after 3 seconds, auto-redirect back to home
      _emptyQueueFallbackTimer = Timer(const Duration(seconds: 3), () {
        if (mounted && ref.read(rideQueueProvider).isEmpty) {
          AppLogger.i('🧾 [RideQueueScreen] No active ride requests found. Returning to home...');
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            context.go('/home');
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _emptyQueueFallbackTimer?.cancel();
    // Safety cleanup — stop alarm if screen is popped unexpectedly
    RideSoundService.instance.stopRideAlert();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final queue = ref.watch(rideQueueProvider);

    // Auto-pop or redirect if no rides are left and not currently accepting a ride
    ref.listen<List<RideRequestItem>>(rideQueueProvider, (prev, next) {
      if (next.isEmpty && _acceptingOrderId == null) {
        AppLogger.i('🧾 [RideQueueScreen] No rides left in queue. Returning to home...');
        if (mounted) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            context.go('/home');
          }
        }
      }
    });

    return PopScope(
      canPop: false, // Force driver to choose Accept or Decline
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        AppSnackBar.show(
          context,
          message: context.l10n.pleaseAcceptOrDeclineRide,
          type: SnackBarType.info,
        );
      },
      child: Scaffold(
        backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
        appBar: AppBar(
          title: const Text('Incoming Requests'),
          automaticallyImplyLeading: false, // Hide back button
          backgroundColor: isDark ? AppColors.darkSurface00 : AppColors.lightSurface00,
          elevation: 0,
        ),
        body: queue.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: AppColors.primary500),
                    SizedBox(height: 16.h),
                    Text(
                      'Checking for incoming requests...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextButton(
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          context.go('/home');
                        }
                      },
                      child: Text(
                        'Return to Home',
                        style: TextStyle(color: AppColors.primary500),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: queue.length,
                itemBuilder: (context, index) {
                  final item = queue[index];
                  final isAcceptingThis = _acceptingOrderId == item.orderId;
                  final isBusy = _isProcessing || _acceptingOrderId != null;

                  return RideRequestCard(
                    item: item,
                    isAccepting: isAcceptingThis,
                    onAccept: isBusy
                        ? () {} // Disable when busy
                        : () async {
                            setState(() {
                              _acceptingOrderId = item.orderId;
                              _isProcessing = true;
                            });

                            AppLogger.i('✅ [RideQueueScreen] Accept tapped for ride: ${item.orderId}');
                            
                            // Stop ride alarm immediately on user action
                            RideSoundService.instance.stopRideAlert();
                            
                            try {
                              final socketClient = ref.read(socketClientProvider);
                              // Ensure socket is active & driver online status is asserted before accepting
                              if (!socketClient.isConnected) {
                                await socketClient.connectSocket();
                              }
                              await socketClient.goOnline(force: true);

                              final prefs = await SharedPreferences.getInstance();
                              final vehicleId = prefs.getString("vehicle_id") ?? "";
                              
                              final apiService = ref.read(apiServiceProvider);
                              final Map<String, dynamic> updatePayload = {
                                "orderId": item.orderId,
                                "orderStatus": "Accepted",
                              };
                              if (vehicleId.isNotEmpty) {
                                updatePayload["vehicleId"] = vehicleId;
                              }

                              final result = await apiService.patch(
                                '/order/update/${item.orderId}',
                                data: updatePayload,
                                converter: (data) => data as Map<String, dynamic>,
                              );

                              switch (result) {
                                case Success(:final data):
                                  if (data['success'] == true) {
                                    final rawRideData = (data['data'] is Map<String, dynamic>)
                                        ? data['data'] as Map<String, dynamic>
                                        : item.rideModel.toJson();
                                    AppLogger.i('Order status successfully updated to Accepted.');
                                    
                                    // Accept via socket to keep server synchronized
                                    ref.read(socketClientProvider).acceptRide(item.rideModel.toJson());
                                    ref.read(rideQueueProvider.notifier).removeRide(item.orderId, reason: 'accepted');
                                    
                                    if (context.mounted) {
                                      final normalized = ref
                                          .read(orderControllerProvider.notifier)
                                          .normalizeOrderData(rawRideData);
                                      context.go('/arriving_client', extra: normalized);
                                    }
                                  } else {
                                    final errorMsg = (data['message'] ?? 'Failed to accept order on server').toString();
                                    if (context.mounted) {
                                      AppSnackBar.showError(
                                        context: context,
                                        message: errorMsg,
                                      );
                                    }
                                    // Remove stale order card immediately if unavailable/cancelled
                                    ref.read(rideQueueProvider.notifier).removeRide(item.orderId, reason: 'order_unavailable');
                                    if (mounted) {
                                      setState(() {
                                        _acceptingOrderId = null;
                                        _isProcessing = false;
                                      });
                                    }
                                    if (context.mounted) {
                                      ref.read(orderControllerProvider.notifier).checkActiveOrder(context);
                                    }
                                  }
                                case Failure(:final error):
                                  final errorMsg = NetworkExceptions.getErrorMessage(error);
                                  AppLogger.w('⚠️ Accept ride request error: $errorMsg');
                                  if (context.mounted) {
                                    AppSnackBar.showError(
                                      context: context,
                                      message: errorMsg,
                                    );
                                  }
                                  // Remove stale order card immediately if server returns error (e.g. 400 Bad Request)
                                  ref.read(rideQueueProvider.notifier).removeRide(item.orderId, reason: 'order_unavailable');
                                  if (mounted) {
                                    setState(() {
                                      _acceptingOrderId = null;
                                      _isProcessing = false;
                                    });
                                  }
                                  if (context.mounted) {
                                    ref.read(orderControllerProvider.notifier).checkActiveOrder(context);
                                  }
                              }
                            } catch (e) {
                              AppLogger.e('Error during ride accept: $e');
                              if (context.mounted) {
                                AppSnackBar.showError(
                                  context: context,
                                  message: 'An unexpected error occurred.',
                                );
                              }
                              ref.read(rideQueueProvider.notifier).removeRide(item.orderId, reason: 'order_error');
                              if (mounted) {
                                setState(() {
                                  _acceptingOrderId = null;
                                  _isProcessing = false;
                                });
                              }
                            }
                          },
                    onDecline: isBusy
                        ? () {} // Disable when busy
                        : () {
                            setState(() {
                              _isProcessing = true;
                            });
                            AppLogger.i('❌ [RideQueueScreen] Decline tapped for ride: ${item.orderId}');
                            // Stop ride alarm immediately on user action
                            RideSoundService.instance.stopRideAlert();
                            ref.read(socketClientProvider).declineRide(item.orderId, reason: 'manual_decline');
                            ref.read(rideQueueProvider.notifier).removeRide(item.orderId, reason: 'declined_manually');
                            setState(() {
                              _isProcessing = false;
                            });
                          },
                  );
                },
              ),
      ),
    );
  }
}
