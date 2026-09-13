import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reachu_driver/app/theme/app_colors.dart';
import 'package:reachu_driver/app/theme/app_dimensions.dart';

/// Opens a premium, iOS-style Cupertino date picker bottom sheet
/// that provides an exceptional user experience on both Android and iOS.
Future<DateTime?> showModernDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  String title = 'Select Date',
  String confirmLabel = 'Confirm',
  String cancelLabel = 'Cancel',
}) async {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  DateTime tempDate = initialDate;

  return showModalBottomSheet<DateTime>(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppDimensions.radiusXL),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle bar
              const SizedBox(height: 10),
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkDivider
                      : AppColors.lightDivider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header Row
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.space20,
                  vertical: AppDimensions.space16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        cancelLabel,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.neutral500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context, tempDate),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: AppColors.primary500,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Date Picker Wheel
              SizedBox(
                height: 220.h,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    brightness: theme.brightness,
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: theme.textTheme.titleMedium
                          ?.copyWith(fontSize: 18.sp),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: initialDate,
                    minimumDate: firstDate,
                    maximumDate: lastDate,
                    onDateTimeChanged: (DateTime newDate) {
                      tempDate = newDate;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
