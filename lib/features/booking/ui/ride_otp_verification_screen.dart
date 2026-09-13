import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reachu_driver/core/network/result.dart';
import 'package:reachu_driver/core/utils/app_logger.dart';
import 'package:reachu_driver/core/utils/app_snackbar.dart';
import 'package:reachu_driver/app/theme/app_colors.dart';
import 'package:reachu_driver/shared/widgets/app_otp_field.dart';
import 'package:reachu_driver/shared/widgets/app_cached_image.dart';
import 'package:reachu_driver/core/network/network_exceptions.dart';
import 'package:reachu_driver/features/booking/repositories/booking_repository.dart';

/// Reusable OTP verification screen.
///
/// Supports three modes via `rideData['otpType']`:
///   - `'pickup'`   (default) — verifies pickup OTP, then updates status to Progress
///   - `'delivery'` — verifies delivery OTP, then updates status to Completed
///   - `'stop'`     — verifies stop OTP (requires `rideData['stopIndex']`)
///
/// Pops with `true` on success, `false` on back/cancel.
class RideOtpVerificationScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? rideData;

  const RideOtpVerificationScreen({super.key, this.rideData});

  @override
  ConsumerState<RideOtpVerificationScreen> createState() =>
      _RideOtpVerificationScreenState();
}

class _RideOtpVerificationScreenState
    extends ConsumerState<RideOtpVerificationScreen> {
  String _enteredOtp = "";
  bool _isLoading = false;
  bool _isResending = false;

  String get _otpType => widget.rideData?['otpType']?.toString() ?? 'pickup';

  String get _orderId =>
      widget.rideData?['orderId']?.toString() ??
      widget.rideData?['rideId']?.toString() ??
      widget.rideData?['_id']?.toString() ??
      widget.rideData?['id']?.toString() ??
      '';

  // ── Contextual UI strings ──

  String get _appBarTitle {
    switch (_otpType) {
      case 'delivery':
        return 'Delivery Verification';
      case 'stop':
        return 'Stop Verification';
      default:
        return 'Start Ride Verification';
    }
  }

  String get _instructionText {
    switch (_otpType) {
      case 'delivery':
        return 'Please enter the 4-digit delivery OTP shared by the receiver to confirm delivery and complete the trip.';
      case 'stop':
        return 'Please enter the 4-digit OTP shared at this stop to confirm goods handover.';
      default:
        return 'Please enter the 4-digit verification code (OTP) shared by the customer to confirm their presence and start the loading journey.';
    }
  }

  String get _buttonText {
    switch (_otpType) {
      case 'delivery':
        return 'Verify & Complete Delivery';
      case 'stop':
        return 'Verify Stop';
      default:
        return 'Verify & Start Ride';
    }
  }

  String get _helperText {
    switch (_otpType) {
      case 'delivery':
        return 'Ensure the cargo has been safely unloaded before verifying';
      case 'stop':
        return 'Ensure the goods have been handed over at this stop';
      default:
        return 'Make sure the cargo is securely loaded before verifying';
    }
  }

  // ── OTP Verification Logic ──

  Future<void> _verifyOtp() async {
    if (_orderId.isEmpty || _enteredOtp.length < 4) {
      AppSnackBar.showError(
        context: context,
        message: 'Please enter a valid 4-digit OTP',
      );
      return;
    }

    setState(() => _isLoading = true);

    final repo = ref.read(bookingRepositoryProvider);

    switch (_otpType) {
      case 'pickup':
        await _handlePickupOtp(repo);
        break;
      case 'delivery':
        await _handleDeliveryOtp(repo);
        break;
      case 'stop':
        await _handleStopOtp(repo);
        break;
    }
  }

  Future<void> _handlePickupOtp(BookingRepository repo) async {
    final result = await repo.verifyPickupOtp(
      orderId: _orderId,
      otp: _enteredOtp,
    );

    switch (result) {
      case Success(:final data):
        if (data['success'] == true) {
          // Update status to Progress
          final updateResult = await repo.updateOrderStatus(
            orderId: _orderId,
            status: 'Progress',
          );
          setState(() => _isLoading = false);

          switch (updateResult) {
            case Success():
              AppLogger.i('Pickup OTP verified, status updated to Progress.');
              if (mounted) {
                AppSnackBar.showSuccess(
                  context: context,
                  message: 'OTP Verified! Journey started.',
                );
                context.pop(true);
              }
            case Failure(:final error):
              AppLogger.e(
                'Failed to update status: ${NetworkExceptions.getErrorMessage(error)}',
              );
              if (mounted) {
                AppSnackBar.showError(
                  context: context,
                  message:
                      'OTP verified, but failed to start trip. Please try again.',
                );
              }
          }
        } else {
          _showOtpError(data['message']);
        }

      case Failure(:final error):
        _showNetworkError(error);
    }
  }

  Future<void> _handleDeliveryOtp(BookingRepository repo) async {
    final result = await repo.verifyDeliveryOtp(
      orderId: _orderId,
      otp: _enteredOtp,
    );

    switch (result) {
      case Success(:final data):
        if (data['success'] == true) {
          // Update status to Completed
          final updateResult = await repo.updateOrderStatus(
            orderId: _orderId,
            status: 'Completed',
          );
          setState(() => _isLoading = false);

          switch (updateResult) {
            case Success(:final data):
              AppLogger.i(
                'Delivery OTP verified, status updated to Completed.',
              );
              if (mounted) {
                AppSnackBar.showSuccess(
                  context: context,
                  message: 'Delivery verified! Trip completed.',
                );
                Map<String, dynamic>? updatedOrder;
                if (data['data'] is Map) {
                  updatedOrder = Map<String, dynamic>.from(data['data'] as Map);
                } else if (data['order'] is Map) {
                  updatedOrder = Map<String, dynamic>.from(data['order'] as Map);
                }
                context.pop(updatedOrder ?? true);
              }
            case Failure(:final error):
              AppLogger.e(
                'Failed to complete trip: ${NetworkExceptions.getErrorMessage(error)}',
              );
              if (mounted) {
                AppSnackBar.showError(
                  context: context,
                  message:
                      'Delivery verified, but failed to complete trip. Try again.',
                );
              }
          }
        } else {
          _showOtpError(data['message']);
        }

      case Failure(:final error):
        _showNetworkError(error);
    }
  }

  Future<void> _handleStopOtp(BookingRepository repo) async {
    final stopIndex = widget.rideData?['stopIndex'] as int? ?? 0;
    final result = await repo.verifyStopOtp(
      orderId: _orderId,
      stopIndex: stopIndex,
      otp: _enteredOtp,
    );

    switch (result) {
      case Success(:final data):
        setState(() => _isLoading = false);
        if (data['success'] == true) {
          AppLogger.i('Stop OTP verified for stop $stopIndex.');
          if (mounted) {
            AppSnackBar.showSuccess(
              context: context,
              message: 'Stop verified successfully!',
            );
            context.pop(true);
          }
        } else {
          _showOtpError(data['message']);
        }

      case Failure(:final error):
        _showNetworkError(error);
    }
  }

  void _showOtpError(String? message) {
    setState(() => _isLoading = false);
    if (mounted) {
      AppSnackBar.showError(
        context: context,
        message: message ?? 'Invalid OTP code. Please try again.',
      );
    }
  }

  void _showNetworkError(NetworkExceptions error) {
    setState(() => _isLoading = false);
    final errorMsg = NetworkExceptions.getErrorMessage(error);
    AppLogger.e('OTP verification error: $errorMsg');
    if (mounted) {
      AppSnackBar.showError(context: context, message: errorMsg);
    }
  }

  // ── Resend OTP ──

  Future<void> _resendOtp() async {
    if (_orderId.isEmpty) return;

    setState(() => _isResending = true);

    final stopIndex = widget.rideData?['stopIndex'] as int?;
    final result = await ref
        .read(bookingRepositoryProvider)
        .resendOtp(
          orderId: _orderId,
          target: _otpType == 'stop' ? 'stop' : _otpType,
          stopIndex: _otpType == 'stop' ? stopIndex : null,
        );

    setState(() => _isResending = false);

    switch (result) {
      case Success(:final data):
        if (mounted) {
          AppSnackBar.showSuccess(
            context: context,
            message: data['message'] ?? 'OTP has been resent successfully.',
          );
        }
      case Failure(:final error):
        if (mounted) {
          AppSnackBar.showError(
            context: context,
            message: NetworkExceptions.getErrorMessage(error),
          );
        }
    }
  }

  // ── Build ──

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ride = widget.rideData ?? {};

    final sender = ride['senderDetails'] as Map?;
    final receiver = ride['receiverDetails'] as Map?;

    // For delivery, prefer receiver name; for pickup, prefer sender name
    final name = _otpType == 'delivery'
        ? (receiver?['name'] ??
              ride['riderName'] ??
              sender?['name'] ??
              'Receiver')
        : (ride['riderName'] ??
              sender?['name'] ??
              receiver?['name'] ??
              'Customer');

    final bookerPhone =
        sender?['phone']?.toString() ?? ride['riderPhone']?.toString() ?? '';
    final stopIdx = widget.rideData?['stopIndex'] as int? ?? 0;
    final activePhone = _otpType == 'delivery'
        ? (receiver?['phone']?.toString() ?? '')
        : (_otpType == 'stop'
              ? (ride['stops'] is List &&
                        (ride['stops'] as List).length > stopIdx
                    ? (ride['stops'] as List)[stopIdx]['receiverPhone']
                              ?.toString() ??
                          ''
                    : '')
              : bookerPhone);

    final isSameAsBooker = activePhone.isNotEmpty && activePhone == bookerPhone;

    final String tagText;
    if (_otpType == 'pickup' || isSameAsBooker) {
      tagText = 'Active Customer';
    } else if (_otpType == 'delivery') {
      tagText = 'Delivery Recipient';
    } else {
      tagText = 'Stop ${stopIdx + 1} Recipient';
    }
    final tagColor = tagText == 'Delivery Recipient'
        ? const Color(0xFF10B981)
        : AppColors.primary500;

    final String? userImage =
        ride['userImage']?.toString() ??
        ride['riderImage']?.toString() ??
        ride['profileImage']?.toString() ??
        (ride['riderId'] is Map
            ? ((ride['riderId'] as Map)['image'] ??
                      (ride['riderId'] as Map)['userImage'] ??
                      (ride['riderId'] as Map)['profileImage'])
                  ?.toString()
            : null) ??
        (ride['rider'] is Map
            ? ((ride['rider'] as Map)['image'] ??
                      (ride['rider'] as Map)['userImage'] ??
                      (ride['rider'] as Map)['profileImage'])
                  ?.toString()
            : null) ??
        (ride['userId'] is Map
            ? ((ride['userId'] as Map)['image'] ??
                      (ride['userId'] as Map)['userImage'] ??
                      (ride['userId'] as Map)['profileImage'])
                  ?.toString()
            : null) ??
        (ride['user'] is Map
            ? ((ride['user'] as Map)['image'] ??
                      (ride['user'] as Map)['userImage'] ??
                      (ride['user'] as Map)['profileImage'])
                  ?.toString()
            : null);

    return Scaffold(
      backgroundColor: isDark ? AppColors.neutral950 : AppColors.neutral50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : AppColors.neutral900,
            size: 20.r,
          ),
          onPressed: () => context.pop(false),
        ),
        title: Text(
          _appBarTitle,
          style: TextStyle(
            color: isDark ? Colors.white : AppColors.neutral900,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.h),

              // Large Glowing User Profile Image or Themed Icon
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: tagColor.withValues(alpha: 0.15),
                      width: 5.r,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: tagColor.withValues(alpha: 0.08),
                        blurRadius: 20.r,
                        spreadRadius: 2.r,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(48.r),
                    child: (_otpType == 'pickup' || isSameAsBooker)
                        ? ((userImage != null &&
                                  userImage.isNotEmpty &&
                                  userImage != 'null')
                              ? AppCachedImage(
                                  imageUrl: userImage,
                                  width: 96.r,
                                  height: 96.r,
                                  fit: BoxFit.cover,
                                  errorWidget: CircleAvatar(
                                    radius: 48.r,
                                    backgroundColor: AppColors.primary50,
                                    child: Icon(
                                      Icons.person,
                                      color: AppColors.primary600,
                                      size: 48.r,
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 48.r,
                                  backgroundColor: AppColors.primary50,
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors.primary600,
                                    size: 48.r,
                                  ),
                                ))
                        : Container(
                            width: 96.r,
                            height: 96.r,
                            color: tagColor.withValues(alpha: 0.1),
                            child: Icon(
                              _otpType == 'delivery'
                                  ? Icons.inventory_2_outlined
                                  : Icons.local_shipping_outlined,
                              size: 44.r,
                              color: tagColor,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Name
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: isDark ? Colors.white : AppColors.neutral900,
                ),
              ),
              SizedBox(height: 4.h),

              // Subtitle Tag
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    tagText,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: tagColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36.h),

              // Instructions Message
              Text(
                _instructionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.neutral500,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              // ── OTP Inputs ──
              Center(
                child: AppOtpField(
                  length: 4,
                  onChanged: (val) {
                    _enteredOtp = val;
                  },
                  onCompleted: (val) {
                    _enteredOtp = val;
                    _verifyOtp();
                  },
                ),
              ),
              SizedBox(height: 16.h),

              // ── Resend OTP ──
              Center(
                child: TextButton(
                  onPressed: _isResending ? null : _resendOtp,
                  child: _isResending
                      ? SizedBox(
                          width: 16.r,
                          height: 16.r,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary500,
                          ),
                        )
                      : Text(
                          'Resend OTP',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary500,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 32.h),

              // ── Verify Button ──
              ElevatedButton(
                onPressed: _isLoading ? null : _verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary600,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  elevation: 0,
                ),
                child: _isLoading
                    ? SizedBox(
                        width: 24.r,
                        height: 24.r,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        _buttonText,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.6,
                        ),
                      ),
              ),
              SizedBox(height: 16.h),

              // Helper message
              Center(
                child: Text(
                  _helperText,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.neutral500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
