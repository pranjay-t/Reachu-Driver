import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/socket/socket_stream_manager.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../payment/providers/payment_controller.dart';

class RidePaymentScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? rideData;

  const RidePaymentScreen({super.key, required this.rideData});

  @override
  ConsumerState<RidePaymentScreen> createState() => _RidePaymentScreenState();
}

class _RidePaymentScreenState extends ConsumerState<RidePaymentScreen> {
  String _selectedMethod = 'cash'; // 'cash' or 'online'
  bool _isLoading = false;
  bool _isWaitingForSocket = false;
  bool _isSuccessTransition = false;
  bool _showFareDetails = false;
  StreamSubscription? _rideStatusSubscription;

  // Online QR states
  String? _qrImageUrl;
  bool _isQrLoading = false;
  String? _qrError;
  bool _isCheckingStatus = false;

  late final String _orderId;
  late final num _netPayable;
  late final Map? _fareBreakdown;

  @override
  void initState() {
    super.initState();

    final ride = widget.rideData ?? {};
    _orderId = (ride['rideId'] ?? ride['orderId'] ?? ride['_id'] ?? '').toString();
    _fareBreakdown = ride['fareBreakdown'] as Map?;
    final rawNetPayable = _fareBreakdown?['netPayable'] ?? ride['totalFare'] ?? ride['netPayable'] ?? 0;
    _netPayable = num.tryParse(rawNetPayable.toString()) ?? 0;

    _setupSocketListener();
  }

  void _setupSocketListener() {
    final socketClient = ref.read(socketClientProvider);
    _rideStatusSubscription = socketClient.rideStatusStream.listen((eventData) {
      AppLogger.d("📬 [RidePaymentScreen] Received status update: $eventData");
      
      final status = (eventData['status']?.toString() ?? '').toLowerCase();
      final eventOrderId = (eventData['orderId'] ?? eventData['id'])?.toString();

      if (eventOrderId == _orderId && status == 'paid') {
        _handlePaymentSuccess();
      }
    });
  }

  void _handlePaymentSuccess() {
    if (_isSuccessTransition) return;
    
    setState(() {
      _isSuccessTransition = true;
      _isLoading = false;
      _isWaitingForSocket = false;
    });

    ref.read(socketClientProvider).completeRide();

    if (mounted) {
      AppSnackBar.showSuccess(
        context: context,
        message: context.l10n.paymentReceivedToast,
      );
      
      Future.delayed(const Duration(milliseconds: 2500), () {
        if (mounted) {
          context.go('/home');
        }
      });
    }
  }

  Future<void> _checkPaymentStatus() async {
    if (_orderId.isEmpty) return;

    setState(() {
      _isCheckingStatus = true;
    });

    try {
      final response = await ref
          .read(paymentControllerProvider.notifier)
          .refreshRidePayment(orderId: _orderId);

      final success = response['success'] as bool? ?? false;
      final data = response['data'] as Map? ?? {};
      final isPaid = data['isPaid'] as bool? ?? false;
      final message = response['message'] as String? ?? '';

      setState(() {
        _isCheckingStatus = false;
      });

      if (success && isPaid) {
        if (mounted) {
          AppSnackBar.showSuccess(
            context: context,
            message: message.isNotEmpty
                ? message
                : context.l10n.paymentReceivedSuccess,
          );
        }
        _handlePaymentSuccess();
      } else {
        if (mounted) {
          AppSnackBar.show(
            context,
            message: message.isNotEmpty
                ? message
                : context.l10n.paymentStillPending,
            type: SnackBarType.info,
          );
        }
      }
    } catch (e) {
      setState(() {
        _isCheckingStatus = false;
      });
      if (mounted) {
        AppSnackBar.showError(
          context: context,
          message: e.toString().replaceAll('Exception:', '').trim(),
        );
      }
    }
  }

  Future<void> _fetchQrCode() async {
    if (_qrImageUrl != null) return; // Already fetched
    
    setState(() {
      _isQrLoading = true;
      _qrError = null;
    });

    try {
      final data = await ref.read(paymentControllerProvider.notifier).getRideQr(orderId: _orderId);
      final url = data['imageUrl']?.toString();
      if (url != null && url.isNotEmpty) {
        setState(() {
          _qrImageUrl = url;
          _isQrLoading = false;
        });
      } else {
        throw Exception('QR image URL not found in response');
      }
    } catch (e) {
      setState(() {
        _isQrLoading = false;
        _qrError = e.toString().replaceAll('Exception:', '').trim();
      });
      if (mounted) {
        AppSnackBar.showError(
          context: context,
          message: context.l10n.failedToLoadQrCode,
        );
      }
    }
  }

  Future<void> _submitCashPayment() async {
    if (_orderId.isEmpty) {
      AppSnackBar.showError(
        context: context,
        message: context.l10n.invalidOrderIdError,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(paymentControllerProvider.notifier).collectCashPayment(orderId: _orderId);
      
      setState(() {
        _isLoading = false;
        _isWaitingForSocket = true;
      });
      
      if (mounted) {
        AppSnackBar.showSuccess(
          context: context,
          message: context.l10n.cashPaymentRecordedWaiting,
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        AppSnackBar.showError(
          context: context,
          message: e.toString().replaceAll('Exception:', '').trim(),
        );
      }
    }
  }

  void _showFullScreenQr() {
    if (_qrImageUrl == null) return;
    
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close QR',
      barrierColor: Colors.black.withValues(alpha: 0.9),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, anim1, anim2) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.close_rounded, color: Colors.white, size: 30.sp),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(width: 8.w),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.scanQrToPay,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '₹${_netPayable.toStringAsFixed(2)}',
                  style: AppTextStyles.displayMedium.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: InteractiveViewer(
                    maxScale: 3.0,
                    child: CachedNetworkImage(
                      imageUrl: _qrImageUrl!,
                      width: 330.w,
                      height: 330.w,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => SizedBox(
                        width: 330.w,
                        height: 330.w,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  context.l10n.pinchToZoomQr,
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: ScaleTransition(
            scale: anim1,
            child: child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _rideStatusSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(paymentControllerProvider);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final backgroundColor = isDark ? AppColors.darkSurface01 : AppColors.lightSurface01;
    final cardBgColor = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;
    final borderColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          context.l10n.collectPayment,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _isSuccessTransition
            ? _buildSuccessView(primaryTextColor, mutedTextColor)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Redesigned Modern Amount Display Block
                          _buildAmountHeader(primaryTextColor, mutedTextColor),
                          SizedBox(height: 24.h),
                          
                          // Sliding Segment Switcher (Custom sliding segmented control for modern UX)
                          _buildModernSegmentedSelector(cardBgColor, borderColor, primaryTextColor),
                          SizedBox(height: 24.h),

                          // Dynamic Content Area (Cash state vs Online QR state)
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: _selectedMethod == 'cash'
                                ? _buildCashPaymentSection(cardBgColor, borderColor, primaryTextColor, mutedTextColor)
                                : _buildOnlinePaymentSection(cardBgColor, borderColor, primaryTextColor, mutedTextColor),
                          ),
                          SizedBox(height: 20.h),

                          // Expandable Fare Details Drawer Section
                          _buildCollapsibleFareSection(cardBgColor, borderColor, primaryTextColor, mutedTextColor),
                        ],
                      ),
                    ),
                  ),
                  
                  // Permanent bottom action zone (Fixed at bottom for easy thumb access while driving)
                  _buildBottomActionZone(primaryTextColor),
                ],
              ),
      ),
    );
  }

  Widget _buildSuccessView(Color textPrimary, Color textMuted) {
    return Stack(
      children: [
        for (int i = 0; i < 40; i++) _buildConfettiParticle(i),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120.r,
                height: 120.r,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF10B981).withValues(alpha: 0.25),
                      blurRadius: 24.r,
                      spreadRadius: 4.r,
                    )
                  ]
                ),
                child: Icon(
                  Icons.celebration_rounded,
                  color: const Color(0xFF10B981),
                  size: 64.sp,
                ),
              ).animate().scale(duration: 500.ms, curve: Curves.elasticOut),
              SizedBox(height: 28.h),
              Text(
                context.l10n.paymentReceivedTitle,
                style: AppTextStyles.headlineMedium.copyWith(
                  color: textPrimary,
                  fontWeight: FontWeight.w900,
                  fontSize: 26.sp,
                ),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0, delay: 200.ms),
              SizedBox(height: 12.h),
              Text(
                context.l10n.amountPaidSuccessfully('₹${_netPayable.toStringAsFixed(2)}'),
                style: AppTextStyles.bodyLarge.copyWith(
                  color: const Color(0xFF10B981),
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fadeIn(delay: 350.ms),
              SizedBox(height: 8.h),
              Text(
                context.l10n.rideClosedReturningHome,
                style: AppTextStyles.bodyMedium.copyWith(color: textMuted),
              ).animate().fadeIn(delay: 500.ms),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConfettiParticle(int index) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.pink,
      Colors.purple,
      Colors.orange,
      Colors.teal
    ];
    final color = colors[index % colors.length];
    final size = (6 + (index % 10)).toDouble();
    final double startX = (index * 12) % 360 - 180;
    
    return Positioned(
      top: -30,
      left: MediaQuery.of(context).size.width / 2 + startX.w,
      child: Icon(
        index % 3 == 0
            ? Icons.star_rounded
            : (index % 3 == 1 ? Icons.circle : Icons.square_rounded),
        color: color,
        size: size.sp,
      )
      .animate(delay: (index * 30).ms)
      .slideY(
        begin: 0,
        end: MediaQuery.of(context).size.height + 50,
        duration: (1200 + (index % 8) * 180).ms,
        curve: Curves.easeIn,
      )
      .rotate(
        begin: 0,
        end: (index % 2 == 0 ? 3.0 : -3.0),
        duration: (1200 + (index % 8) * 180).ms,
      ),
    );
  }

  Widget _buildAmountHeader(Color textPrimary, Color textMuted) {
    final isCash = _selectedMethod == 'cash';
    final accentColor = isCash ? const Color(0xFF10B981) : AppColors.primary500;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.2),
          width: 1.5.w,
        ),
      ),
      child: Column(
        children: [
          Text(
            isCash ? context.l10n.collectCashFromCustomer : context.l10n.customerOnlineFareDue,
            style: AppTextStyles.labelSmall.copyWith(
              color: accentColor,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            '₹${_netPayable.toStringAsFixed(2)}',
            style: AppTextStyles.displayMedium.copyWith(
              color: textPrimary,
              fontWeight: FontWeight.w900,
              fontSize: 38.sp,
            ),
          ),
          SizedBox(height: 10.h),
          // Modern Pill Chip Button for Status Refresh (Visible on all tabs)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _isCheckingStatus ? null : _checkPaymentStatus,
              borderRadius: BorderRadius.circular(20.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.3),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _isCheckingStatus
                        ? SizedBox(
                            width: 14.w,
                            height: 14.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: accentColor,
                            ),
                          )
                        : Icon(
                            Icons.sync_rounded,
                            color: accentColor,
                            size: 15.sp,
                          ),
                    SizedBox(width: 6.w),
                    Text(
                      _isCheckingStatus ? context.l10n.checkingStatus : context.l10n.checkPaymentStatus,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: accentColor,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().scale(begin: const Offset(0.97, 0.97));
  }

  Widget _buildModernSegmentedSelector(Color cardBg, Color border, Color textPrimary) {
    final isCash = _selectedMethod == 'cash';
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: border, width: 1.2.w),
      ),
      child: Stack(
        children: [
          // Sliding background
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: isCash ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.43,
              margin: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: isCash ? const Color(0xFF10B981) : AppColors.primary500,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: (isCash ? const Color(0xFF10B981) : AppColors.primary500).withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              ),
            ),
          ),
          // Toggle labels
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _isLoading
                      ? null
                      : () => setState(() {
                            _selectedMethod = 'cash';
                            _isWaitingForSocket = false; // Reset waiting state so they can click to collect cash
                          }),
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.payments_rounded,
                          color: isCash ? Colors.white : textPrimary.withValues(alpha: 0.6),
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          context.l10n.cashPayment,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: isCash ? Colors.white : textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: _isLoading
                      ? null
                      : () {
                          setState(() {
                            _selectedMethod = 'online';
                            _isWaitingForSocket = true; // Auto start waiting for online
                          });
                          _fetchQrCode();
                        },
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner_rounded,
                          color: !isCash ? Colors.white : textPrimary.withValues(alpha: 0.6),
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          context.l10n.onlineQr,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: !isCash ? Colors.white : textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCashPaymentSection(Color cardBg, Color border, Color textPrimary, Color textMuted) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.info_outline_rounded, color: const Color(0xFF10B981), size: 22.sp),
              ),
              SizedBox(width: 12.w),
              Text(
                context.l10n.collectCashInstructions,
                style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold, color: textPrimary),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            context.l10n.collectCashStep1('₹${_netPayable.toStringAsFixed(2)}'),
            style: AppTextStyles.bodyMedium.copyWith(color: textPrimary, height: 1.45),
          ),
          SizedBox(height: 8.h),
          Text(
            context.l10n.collectCashStep2,
            style: AppTextStyles.bodyMedium.copyWith(color: textPrimary, height: 1.45),
          ),
          if (_isWaitingForSocket) ...[
            Divider(height: 32.h, color: border),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 32.w,
                    height: 32.w,
                    child: CircularProgressIndicator(
                      color: const Color(0xFF10B981),
                      strokeWidth: 2.5,
                    ),
                  ).animate(onPlay: (controller) => controller.repeat())
                   .shimmer(duration: 1500.ms, color: const Color(0xFF10B981).withValues(alpha: 0.3)),
                  SizedBox(height: 12.h),
                  Text(
                    context.l10n.verifyingCashDeposit,
                    style: AppTextStyles.bodyMedium.copyWith(color: textPrimary, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    context.l10n.pleaseHoldClosingRide,
                    style: AppTextStyles.bodySmall.copyWith(color: textMuted),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 250.ms);
  }

  Widget _buildOnlinePaymentSection(Color cardBg, Color border, Color textPrimary, Color textMuted) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Instructions Header
          Row(
            children: [
              Icon(Icons.qr_code_2_rounded, color: AppColors.primary500, size: 24.sp),
              SizedBox(width: 12.w),
              Text(
                context.l10n.customerOnlinePayment,
                style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold, color: textPrimary),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          
          // QR Block
          Center(
            child: _isQrLoading
                ? Container(
                    height: 220.h,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 40.w,
                          child: CircularProgressIndicator(
                            color: AppColors.primary500,
                            strokeWidth: 3,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          context.l10n.generatingQrCode,
                          style: AppTextStyles.bodyMedium.copyWith(color: textMuted, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                : _qrError != null
                    ? Container(
                        height: 220.h,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline_rounded, color: AppColors.errorLight, size: 44.sp),
                            SizedBox(height: 10.h),
                            Text(
                              context.l10n.failedToLoadQrCode,
                              style: AppTextStyles.bodyMedium.copyWith(color: textPrimary, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 14.h),
                            ElevatedButton.icon(
                              onPressed: _fetchQrCode,
                              icon: const Icon(Icons.refresh_rounded, color: Colors.white),
                              label: Text(context.l10n.retry, style: const TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary500,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : _qrImageUrl != null
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: _showFullScreenQr,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(12.r),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(alpha: 0.08),
                                            blurRadius: 16,
                                            offset: const Offset(0, 4),
                                          )
                                        ],
                                        border: Border.all(color: border, width: 1.w),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: _qrImageUrl!,
                                        width: 220.w,
                                        height: 220.w,
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) => SizedBox(
                                          width: 220.w,
                                          height: 220.w,
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => Icon(
                                          Icons.broken_image_outlined,
                                          color: AppColors.errorLight,
                                          size: 40.sp,
                                        ),
                                      ),
                                    ),
                                    // Hint overlay on hover/visual
                                    Positioned(
                                      bottom: 12.h,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withValues(alpha: 0.7),
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.fullscreen_rounded, color: Colors.white, size: 14.sp),
                                            SizedBox(width: 4.w),
                                            Text(
                                              context.l10n.tapToFullScreen,
                                              style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              
                              // Active waiting banner
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primary500.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 16.w,
                                      height: 16.w,
                                      child: CircularProgressIndicator(
                                        color: AppColors.primary500,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      context.l10n.awaitingCustomerPayment,
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: AppColors.primary500,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 250.ms);
  }

  String _camelCaseToTitleCase(String text) {
    if (text.isEmpty) return text;
    final result = text.replaceAllMapped(
      RegExp(r'(^|[a-z])([A-Z])'),
      (Match m) => '${m[1]} ${m[2]}',
    );
    return result[0].toUpperCase() + result.substring(1);
  }

  IconData _getFareIcon(String key) {
    switch (key) {
      case 'baseFare':
        return Icons.directions_car_rounded;
      case 'weatherSurcharge':
        return Icons.thunderstorm_rounded;
      case 'trafficSurcharge':
        return Icons.traffic_rounded;
      case 'waitingCharge':
        return Icons.schedule_rounded;
      case 'rental':
        return Icons.timer_rounded;
      case 'promoCodeDiscount':
      case 'discount':
        return Icons.local_offer_rounded;
      case 'tollFee':
        return Icons.toll_rounded;
      case 'nightSurcharge':
        return Icons.nights_stay_rounded;
      case 'surgeFee':
        return Icons.bolt_rounded;
      case 'tax':
      case 'platformFee':
        return Icons.receipt_long_rounded;
      default:
        return Icons.payments_rounded;
    }
  }

  Widget _buildCollapsibleFareSection(Color cardBg, Color border, Color textPrimary, Color textMuted) {
    final fareBreakdown = _fareBreakdown;
    if (fareBreakdown == null || fareBreakdown.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Widget> fareRows = [];

    final knownLabels = <String, String>{
      'baseFare': context.l10n.baseFare,
      'weatherSurcharge': context.l10n.weatherSurcharge,
      'trafficSurcharge': context.l10n.trafficSurcharge,
      'waitingCharge': context.l10n.waitingCharge,
      'rental': context.l10n.rentalCharge,
      'grossFare': context.l10n.grossFare,
      'promoCodeDiscount': context.l10n.promoDiscount,
      'pendingDue': context.l10n.pendingDue,
      'tollFee': context.l10n.tollFee,
      'cancellationFee': context.l10n.cancellationFee,
      'nightSurcharge': context.l10n.nightSurcharge,
      'surgeFee': context.l10n.surgeFee,
      'tax': context.l10n.taxAndFees,
      'platformFee': context.l10n.platformFee,
    };

    final discountKeys = {'promoCodeDiscount', 'discount', 'couponDiscount'};
    final skipKeys = {'netPayable', 'currency', 'promoCode', '_id', 'id'};

    fareBreakdown.forEach((key, rawVal) {
      if (skipKeys.contains(key)) return;

      final double? val = double.tryParse(rawVal?.toString() ?? '');
      if (val == null || val == 0) return; // Skip if null or zero

      final isDiscount = discountKeys.contains(key) || val < 0;
      final displayVal = isDiscount ? -val.abs() : val;
      final color = isDiscount ? const Color(0xFF10B981) : textPrimary;
      final label = knownLabels[key] ?? _camelCaseToTitleCase(key.toString());
      final icon = _getFareIcon(key.toString());

      if (fareRows.isNotEmpty) {
        fareRows.add(Divider(height: 18.h, color: border.withValues(alpha: 0.5)));
      }

      fareRows.add(_buildFareRow(label, displayVal, color, textPrimary, icon));

      if (discountKeys.contains(key)) {
        fareRows.add(Divider(height: 18.h, color: border.withValues(alpha: 0.5)));
        fareRows.add(_buildFareRow(
          context.l10n.reachuWalletCredit,
          val.abs(),
          const Color(0xFF10B981),
          const Color(0xFF10B981),
          Icons.account_balance_wallet_rounded,
        ));
      }
    });

    if (fareRows.isEmpty) {
      return const SizedBox.shrink();
    }

    final double promoDiscount = double.tryParse(fareBreakdown['promoCodeDiscount']?.toString() ?? '0') ?? 0.0;
    final double waitingCharge = double.tryParse(fareBreakdown['waitingCharge']?.toString() ?? '0') ?? 0.0;

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _showFareDetails = !_showFareDetails;
            });
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: border, width: 1.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(7.r),
                      decoration: BoxDecoration(
                        color: AppColors.primary500.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.receipt_long_rounded,
                        color: AppColors.primary500,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      context.l10n.detailedFareBreakdown,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: textPrimary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: textMuted.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        _showFareDetails ? context.l10n.hide : context.l10n.details,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        _showFareDetails
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: textPrimary,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_showFareDetails) ...[
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: border, width: 1.2.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ...fareRows,
                if (promoDiscount > 0 || waitingCharge > 0) ...[
                  Divider(height: 24.h, color: border.withValues(alpha: 0.6)),
                  if (promoDiscount > 0) ...[
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border(
                          left: BorderSide(color: const Color(0xFF10B981), width: 3.5.w),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.card_giftcard_rounded, size: 15.sp, color: const Color(0xFF10B981)),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              context.l10n.promoReimbursementNote('₹${promoDiscount.toStringAsFixed(2)}'),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: const Color(0xFF10B981),
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (waitingCharge > 0) SizedBox(height: 8.h),
                  ],
                  if (waitingCharge > 0) ...[
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B).withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border(
                          left: BorderSide(color: const Color(0xFFD97706), width: 3.5.w),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.schedule_rounded, size: 15.sp, color: const Color(0xFFD97706)),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              context.l10n.waitingChargeNote('₹${waitingCharge.toStringAsFixed(2)}'),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: const Color(0xFFD97706),
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ).animate().fadeIn(duration: 200.ms).slideY(begin: -0.04, end: 0),
        ]
      ],
    );
  }

  Widget _buildFareRow(String title, double val, Color valueColor, Color titleColor, IconData icon) {
    final bool isDiscount = val < 0;
    final String prefix = isDiscount ? '-' : '';
    final double absoluteValue = val.abs();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: isDiscount
                      ? const Color(0xFF10B981).withValues(alpha: 0.1)
                      : AppColors.primary500.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 14.sp,
                  color: isDiscount ? const Color(0xFF10B981) : AppColors.primary500,
                ),
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: isDiscount
                ? const Color(0xFF10B981).withValues(alpha: 0.1)
                : titleColor.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isDiscount
                  ? const Color(0xFF10B981).withValues(alpha: 0.25)
                  : Colors.transparent,
              width: 1.w,
            ),
          ),
          child: Text(
            '$prefix₹${absoluteValue.toStringAsFixed(2)}',
            style: AppTextStyles.monoMedium.copyWith(
              color: isDiscount ? const Color(0xFF10B981) : valueColor,
              fontWeight: FontWeight.w800,
              fontSize: 13.5.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActionZone(Color textPrimary) {
    final isCash = _selectedMethod == 'cash';
    
    // Only show button at the bottom if cash is selected and not waiting for socket
    if (!isCash || _isWaitingForSocket) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark 
                ? AppColors.neutral800 
                : AppColors.neutral200,
            width: 1.w,
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _submitCashPayment,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF10B981),
            disabledBackgroundColor: const Color(0xFF10B981).withValues(alpha: 0.5),
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 0,
          ),
          child: _isLoading
              ? SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  context.l10n.confirmCashReceived,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    ).animate().slideY(begin: 0.1, end: 0, duration: 250.ms);
  }
}
