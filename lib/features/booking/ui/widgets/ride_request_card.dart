import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../providers/ride_queue_provider.dart';

class RideRequestCard extends StatelessWidget {
  final RideRequestItem item;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final bool isAccepting;

  const RideRequestCard({
    super.key,
    required this.item,
    required this.onAccept,
    required this.onDecline,
    required this.isAccepting,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final model = item.rideModel;
    final pickupAddress = model.startLocation.address;
    final dropAddress = model.endLocation.address;
    final fare = model.totalFare.toStringAsFixed(2);
    final distance = model.distance.toString();

    // Map timeline steps dynamically (Pickup -> Stops -> Drop-off)
    final List<Map<String, dynamic>> steps = [
      {
        'label': 'PICKUP',
        'address': pickupAddress,
        'icon': Icon(
          Icons.radio_button_checked_rounded,
          color: AppColors.primary500,
          size: 20.r,
        ),
      },
      ...model.stops.asMap().entries.map((entry) {
        final idx = entry.key;
        final stop = entry.value;
        return {
          'label': 'STOP ${idx + 1}',
          'address': stop.address,
          'subValue': stop.receiverName.isNotEmpty
              ? 'Recipient: ${stop.receiverName} (${stop.receiverPhone})'
              : null,
          'icon': Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: AppColors.primary500.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${idx + 1}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: AppColors.primary500,
                fontWeight: FontWeight.bold,
                fontSize: 10.sp,
              ),
            ),
          ),
        };
      }),
      {
        'label': 'DROP-OFF',
        'address': dropAddress,
        'icon': Icon(
          Icons.location_on_rounded,
          color: AppColors.errorDark,
          size: 20.r,
        ),
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        border: Border.all(
          color: isDark ? AppColors.neutral800 : AppColors.neutral200,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: New Request & Timer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primary500.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'NEW RIDE OFFER',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 16.r,
                    color: item.remainingSeconds <= 5
                        ? AppColors.errorLight
                        : AppColors.neutral500,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${item.remainingSeconds}s',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: item.remainingSeconds <= 5
                          ? AppColors.errorLight
                          : AppColors.neutral500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Progress Indicator
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: item.progress,
              backgroundColor: AppColors.primary500.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation<Color>(
                item.remainingSeconds <= 5
                    ? AppColors.errorLight
                    : AppColors.primary500,
              ),
              minHeight: 4.h,
            ),
          ),
          SizedBox(height: 16.h),

          // Details Chips Row
          Wrap(
            spacing: 8.w,
            runSpacing: 6.h,
            children: [
              _buildDetailChip(
                context,
                icon: Icons.local_shipping_outlined,
                label: '${model.estimatedWeight.toStringAsFixed(0)} kg',
                isDark: isDark,
              ),
              _buildDetailChip(
                context,
                icon: Icons.inventory_2_outlined,
                label: model.goodsDetails.description,
                isDark: isDark,
              ),
              if (model.isFragile)
                _buildDetailChip(
                  context,
                  icon: Icons.warning_amber_rounded,
                  label: 'Fragile',
                  color: AppColors.warningLight,
                  isDark: isDark,
                ),
              _buildDetailChip(
                context,
                icon: model.rideType == 'immediate'
                    ? Icons.flash_on
                    : Icons.calendar_today,
                label: model.rideType.toUpperCase(),
                isDark: isDark,
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Address Timeline (Pickup -> Intermediate Stops -> Drop-off)
          ...List.generate(steps.length, (idx) {
            final step = steps[idx];
            final showLine = idx < steps.length - 1;
            final label = step['label'] as String;
            final address = step['address'] as String;
            final subValue = step['subValue'] as String?;
            final icon = step['icon'] as Widget;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      icon,
                      if (showLine)
                        Expanded(
                          child: Container(
                            width: 2.w,
                            margin: EdgeInsets.symmetric(vertical: 4.h),
                            color: isDark
                                ? AppColors.neutral700
                                : AppColors.neutral300,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.neutral500,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          address,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (subValue != null) ...[
                          SizedBox(height: 2.h),
                          Text(
                            subValue,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.neutral500,
                            ),
                          ),
                        ],
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),

          // Divider
          Divider(
            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
            thickness: 1.h,
          ),
          SizedBox(height: 12.h),

          // Fare & Distance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EST. DISTANCE',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.neutral500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '$distance km',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'EST. FARE',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.neutral500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '₹$fare',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.successLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Actions
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Decline',
                  variant: AppButtonVariant.outlined,
                  onPressed: isAccepting ? null : onDecline,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppButton(
                  label: 'Accept',
                  isLoading: isAccepting,
                  onPressed: onAccept,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    Color? color,
    required bool isDark,
  }) {
    final theme = Theme.of(context);
    final activeColor = color ?? AppColors.neutral500;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface03 : AppColors.lightSurface02,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isDark ? AppColors.neutral800 : AppColors.neutral200,
          width: 0.5.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.r, color: activeColor),
          SizedBox(width: 4.w),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isDark ? AppColors.neutral300 : AppColors.neutral700,
              fontWeight: FontWeight.w600,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
