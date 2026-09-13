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

  @override
  void dispose() {
    // Safety cleanup — stop alarm if screen is popped unexpectedly
    RideSoundService.instance.stopRideAlert();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final queue = ref.watch(rideQueueProvider);

    // Auto-pop or redirect if no rides are left
    ref.listen<List<RideRequestItem>>(rideQueueProvider, (prev, next) {
      if (next.isEmpty) {
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
                      'Reconnecting or loading...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.neutral500,
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
                              final prefs = await SharedPreferences.getInstance();
                              final vehicleId = prefs.getString("vehicle_id") ?? "";
                              
                              final apiService = ref.read(apiServiceProvider);
                              final result = await apiService.patch(
                                '/order/update/${item.orderId}',
                                data: {
                                  "orderId": item.orderId,
                                  "vehicleId": vehicleId,
                                  "orderStatus": "Accepted"
                                },
                                converter: (data) => data as Map<String, dynamic>,
                              );

                              switch (result) {
                                case Success(:final data):
                                  if (data['success'] == true) {
                                    final updatedRideData = data['data'] as Map<String, dynamic>;
                                    AppLogger.i('Order status successfully updated to Accepted.');
                                    
                                    // Accept via socket to keep server synchronized
                                    ref.read(socketClientProvider).acceptRide(item.rideModel.toJson());
                                    ref.read(rideQueueProvider.notifier).removeRide(item.orderId, reason: 'accepted');
                                    
                                    if (context.mounted) {
                                      context.go('/arriving_client', extra: updatedRideData);
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
                                    setState(() {
                                      _acceptingOrderId = null;
                                      _isProcessing = false;
                                    });
                                  }
                                case Failure(:final error):
                                  final errorMsg = NetworkExceptions.getErrorMessage(error);
                                  if (context.mounted) {
                                    AppSnackBar.showError(
                                      context: context,
                                      message: errorMsg,
                                    );
                                  }
                                  // Remove stale order card immediately if server returns error (e.g. 400 Bad Request)
                                  ref.read(rideQueueProvider.notifier).removeRide(item.orderId, reason: 'order_unavailable');
                                  setState(() {
                                    _acceptingOrderId = null;
                                    _isProcessing = false;
                                  });
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
                              setState(() {
                                _acceptingOrderId = null;
                                _isProcessing = false;
                              });
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
