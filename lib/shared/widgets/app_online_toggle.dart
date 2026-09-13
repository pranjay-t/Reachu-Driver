import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/app_colors.dart';

class AppOnlineToggle extends StatelessWidget {
  final bool value;
  final bool isProcessing;
  final ValueChanged<bool> onChanged;

  const AppOnlineToggle({
    super.key,
    required this.value,
    required this.isProcessing,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final double width = 62.w;
    final double height = 30.h;
    final double thumbSize = 24.r;

    return GestureDetector(
      onTap: isProcessing ? null : () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          gradient: value
              ? const LinearGradient(
                  colors: [Color(0xFF34D399), Color(0xFF10B981)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: isDark
                      ? [const Color(0xFF374151), const Color(0xFF1F2937)]
                      : [const Color(0xFFE5E7EB), const Color(0xFFD1D5DB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          boxShadow: [
            if (value)
              BoxShadow(
                color: const Color(0xFF10B981).withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
          border: Border.all(
            color: value
                ? const Color(0xFF34D399).withValues(alpha: 0.5)
                : (isDark ? const Color(0xFF4B5563) : const Color(0xFFE5E7EB)),
            width: 1.w,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Smooth sliding thumb alignment
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: thumbSize,
                height: thumbSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: isProcessing
                    ? Padding(
                        padding: EdgeInsets.all(5.r),
                        child: SizedBox(
                          width: 14.r,
                          height: 14.r,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.r,
                            color: value ? const Color(0xFF10B981) : AppColors.neutral500,
                          ),
                        ),
                      )
                    : Icon(
                        value ? Icons.check_rounded : Icons.power_settings_new_rounded,
                        size: 14.sp,
                        color: value ? const Color(0xFF10B981) : AppColors.neutral500,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
