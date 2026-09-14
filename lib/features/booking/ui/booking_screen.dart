import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../shared/widgets/app_cached_image.dart';
import '../providers/booking_history_controller.dart';

class BookingScreen extends ConsumerStatefulWidget {
  const BookingScreen({super.key});

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(bookingHistoryControllerProvider.notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    
    final stateAsync = ref.watch(bookingHistoryControllerProvider);

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          context.l10n.rideHistory,
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
            stateAsync.maybeWhen(
              data: (state) => _buildTabBar(state, isDark),
              orElse: () => _buildStaticTabBar(isDark),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => ref.read(bookingHistoryControllerProvider.notifier).refresh(),
                color: AppColors.primary500,
                backgroundColor: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
                child: stateAsync.when(
                  data: (state) {
                    final filteredRides = state.filterStatus == null
                        ? state.rides
                        : state.rides.where((ride) {
                            final rStatus = ride['orderStatus']?.toString().toLowerCase() ?? '';
                            return rStatus == state.filterStatus!.toLowerCase();
                          }).toList();

                    if (filteredRides.isEmpty) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_shipping_outlined,
                                  color: mutedTextColor,
                                  size: 64.sp,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  context.l10n.noRidesFound,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: mutedTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    return ListView.separated(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      itemCount: filteredRides.length + (state.hasMore ? 1 : 0),
                      separatorBuilder: (context, index) => SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        if (index == filteredRides.length) {
                          return _buildLoadingIndicator(isDark);
                        }

                        final ride = filteredRides[index];
                        return _buildRideCard(ride, isDark, index);
                      },
                    );
                  },
                  loading: () => _buildShimmerLoadingList(isDark),
                  error: (error, stack) => ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              context.l10n.failedToLoadHistory,
                              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.errorLight),
                            ),
                            SizedBox(height: 12.h),
                            ElevatedButton(
                              onPressed: () => ref.read(bookingHistoryControllerProvider.notifier).refresh(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary500,
                              ),
                              child: Text(context.l10n.retry, style: const TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticTabBar(bool isDark) {
    final trackColor = isDark ? AppColors.neutral800 : AppColors.neutral100;
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: trackColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(child: _buildStaticTabItem(context.l10n.all)),
          Expanded(child: _buildStaticTabItem(context.l10n.completed)),
          Expanded(child: _buildStaticTabItem(context.l10n.cancelled)),
        ],
      ),
    );
  }

  Widget _buildStaticTabItem(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.neutral500,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget _buildTabBar(BookingHistoryState state, bool isDark) {
    final activeIndex = state.filterStatus == null
        ? 0
        : (state.filterStatus == 'Completed' ? 1 : 2);
    
    final labelColor = isDark ? Colors.white : Colors.black;
    final trackColor = isDark ? AppColors.neutral800 : AppColors.neutral100;
    final activeBgColor = isDark ? AppColors.primary500 : AppColors.primary500;

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: trackColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(child: _buildTabItem(0, context.l10n.all, activeIndex == 0, activeBgColor, labelColor)),
          Expanded(child: _buildTabItem(1, context.l10n.completed, activeIndex == 1, activeBgColor, labelColor)),
          Expanded(child: _buildTabItem(2, context.l10n.cancelled, activeIndex == 2, activeBgColor, labelColor)),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title, bool isActive, Color activeBg, Color labelColor) {
    return GestureDetector(
      onTap: () {
        String? status;
        if (index == 1) status = 'Completed';
        if (index == 2) status = 'Cancelled';
        ref.read(bookingHistoryControllerProvider.notifier).filterByStatus(status);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? activeBg : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isActive
                ? (activeBg == AppColors.primary500 ? Colors.white : labelColor)
                : AppColors.neutral500,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildRideCard(Map<String, dynamic> ride, bool isDark, int index) {
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final cardBgColor = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;
    final borderColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    final String status = ride['orderStatus']?.toString() ?? 'Pending';
    final String startAddr = ride['startLocation']?['address']?.toString() ?? 'N/A';
    final String endAddr = ride['endLocation']?['address']?.toString() ?? 'N/A';
    
    // Format Date
    String dateStr = 'N/A';
    final createdAt = ride['createdAt'];
    if (createdAt != null) {
      try {
        final parsedDate = DateTime.parse(createdAt.toString()).toLocal();
        final locale = Localizations.localeOf(context).languageCode;
        dateStr = DateFormat('dd MMM yyyy, hh:mm a', locale).format(parsedDate);
      } catch (_) {}
    }

    final subType = ride['vehicleSubType'] as Map?;
    final vehicleName = subType?['name']?.toString() ?? 'Vehicle';
    final vehicleImage = subType?['image']?.toString();

    // Stops info
    final stops = ride['stops'] as List? ?? [];
    final stopsCount = stops.length;

    // Fare breakdown
    final fareMap = ride['fareBreakdown'] as Map?;
    final num netPayable = fareMap?['netPayable'] ?? ride['totalFare'] ?? 0;
    final String rawPaymentMethod = ride['paymentMethod']?.toString() ?? 'Cash';
    final String paymentMethod = rawPaymentMethod.toLowerCase() == 'cash' ? context.l10n.cash : rawPaymentMethod;

    // Status Styling
    final isCompleted = status.toLowerCase() == 'completed';
    final isCancelled = status.toLowerCase() == 'cancelled';
    final isPaid = ride['isPaid'] == true || ride['isPaid']?.toString().toLowerCase() == 'true';

    final String displayStatus;
    final Color statusColor;
    final IconData statusIcon;

    if (isCompleted) {
      if (isPaid) {
        displayStatus = context.l10n.completed;
        statusColor = const Color(0xFF10B981);
        statusIcon = Icons.check_circle_rounded;
      } else {
        displayStatus = context.l10n.paymentPending;
        statusColor = const Color(0xFFF59E0B);
        statusIcon = Icons.warning_amber_rounded;
      }
    } else if (isCancelled) {
      displayStatus = context.l10n.cancelled;
      statusColor = const Color(0xFFEF4444);
      statusIcon = Icons.cancel_rounded;
    } else {
      displayStatus = status;
      statusColor = AppColors.primary500;
      statusIcon = Icons.pending_rounded;
    }

    return InkWell(
      onTap: () => context.push('/ride_details', extra: ride),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
              blurRadius: 10.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Time & Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateStr,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: mutedTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        statusIcon,
                        color: statusColor,
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        displayStatus,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 24.h, color: borderColor),

            // Route details (Pickup ➔ Dropoff)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(Icons.radio_button_checked_rounded, color: const Color(0xFF10B981), size: 18.sp),
                    Container(
                      width: 2.w,
                      height: 36.h,
                      color: isDark ? AppColors.neutral700 : AppColors.neutral300,
                    ),
                    Icon(Icons.location_on_rounded, color: const Color(0xFFEF4444), size: 18.sp),
                  ],
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Pickup Address
                      Text(
                        startAddr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: primaryTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      // Dropoff Address
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              endAddr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: primaryTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (stopsCount > 0) ...[
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: AppColors.primary500.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                '$stopsCount stops',
                                style: TextStyle(
                                  color: AppColors.primary500,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 24.h, color: borderColor),

            // Bottom Section: Vehicle and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildVehicleImage(vehicleImage),
                    SizedBox(width: 8.w),
                    Text(
                      vehicleName,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${netPayable.toStringAsFixed(0)}',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      paymentMethod,
                      style: TextStyle(
                        color: mutedTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ).animate().fade(duration: 350.ms, delay: (index.clamp(0, 4) * 50).ms).slideY(begin: 0.1, end: 0, delay: (index.clamp(0, 4) * 50).ms),
    );
  }

  Widget _buildVehicleImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return Icon(Icons.local_shipping, size: 24.sp, color: AppColors.neutral500);
    }

    return AppCachedImage(
      imageUrl: imagePath,
      width: 32.w,
      height: 32.h,
      fit: BoxFit.contain,
      errorWidget: Icon(Icons.local_shipping, size: 24.sp, color: AppColors.neutral500),
    );
  }

  Widget _buildLoadingIndicator(bool isDark) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: SizedBox(
          width: 24.w,
          height: 24.w,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: AppColors.primary500,
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerLoadingList(bool isDark) {
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
      highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return Container(
            height: 180.h,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
              borderRadius: BorderRadius.circular(16.r),
            ),
          );
        },
      ),
    );
  }
}
