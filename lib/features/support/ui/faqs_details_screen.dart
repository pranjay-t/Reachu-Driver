import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';

class FaqsDetailsScreen extends StatefulWidget {
  final String? question;
  final String? answer;
  final String? categoryName;

  const FaqsDetailsScreen({
    super.key,
    this.question,
    this.answer,
    this.categoryName,
  });

  @override
  State<FaqsDetailsScreen> createState() => _FaqsDetailsScreenState();
}

class _FaqsDetailsScreenState extends State<FaqsDetailsScreen> {
  bool? isHelpful; // null = none, true = Yes, false = No

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final secondaryTextColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final borderColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark
            ? AppColors.darkSurface01
            : AppColors.lightSurface01,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryTextColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.categoryName ?? "FAQ Details",
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Question Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: cardBgColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary500.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.help_outline,
                          color: AppColors.primary500,
                          size: 20.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          widget.question ?? "",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Divider(
                    height: 1,
                    color: borderColor,
                  ),
                  SizedBox(height: 16.h),

                  /// Answer Body
                  Text(
                    widget.answer ?? "No answer details available.",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: secondaryTextColor,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            /// Feedback Section
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: cardBgColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WAS THIS INFORMATION USEFUL?",
                    style: AppTextStyles.labelSmall.copyWith(
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  /// Yes / No Buttons
                  Row(
                    children: [
                      /// YES
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              isHelpful = true;
                            });
                            Fluttertoast.showToast(
                              msg: "Thank you for your feedback!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: AppColors.successLight,
                              textColor: Colors.white,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: isHelpful == true
                                ? AppColors.primary500.withOpacity(0.1)
                                : Colors.transparent,
                            side: BorderSide(
                              color: isHelpful == true
                                  ? AppColors.primary500
                                  : borderColor,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          icon: Icon(
                            Icons.thumb_up_outlined,
                            size: 18.w,
                            color: isHelpful == true
                                ? AppColors.primary500
                                : primaryTextColor,
                          ),
                          label: Text(
                            "Yes",
                            style: AppTextStyles.labelLarge.copyWith(
                              color: isHelpful == true
                                  ? AppColors.primary500
                                  : primaryTextColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),

                      /// NO
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              isHelpful = false;
                            });
                            Fluttertoast.showToast(
                              msg: "Thank you! We will improve this answer.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: AppColors.warningLight,
                              textColor: Colors.white,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: isHelpful == false
                                ? AppColors.errorDark.withOpacity(0.1)
                                : Colors.transparent,
                            side: BorderSide(
                              color: isHelpful == false
                                  ? AppColors.errorDark
                                  : borderColor,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          icon: Icon(
                            Icons.thumb_down_outlined,
                            size: 18.w,
                            color: isHelpful == false
                                ? AppColors.errorDark
                                : primaryTextColor,
                          ),
                          label: Text(
                            "No",
                            style: AppTextStyles.labelLarge.copyWith(
                              color: isHelpful == false
                                  ? AppColors.errorDark
                                  : primaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
