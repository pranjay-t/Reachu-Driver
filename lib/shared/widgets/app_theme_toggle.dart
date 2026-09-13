import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeToggle extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onChanged;

  const AppThemeToggle({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double width = 62.w;
    final double height = 30.h;
    final double thumbSize = 24.r;

    return GestureDetector(
      onTap: () => onChanged(!isDark),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          gradient: isDark
              ? const LinearGradient(
                  colors: [Color(0xFFFF4D4D), Color(0xFFE70211)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFFFFEE58), Color(0xFFFFC800)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          boxShadow: [
            BoxShadow(
              color: (isDark ? const Color(0xFFFF4D4D) : const Color(0xFFFFC800))
                  .withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: isDark
                ? const Color(0xFFFF4D4D).withValues(alpha: 0.5)
                : const Color(0xFFFFC800).withValues(alpha: 0.5),
            width: 1.w,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Sliding thumb
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: thumbSize,
                height: thumbSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                  size: 13.sp,
                  color: isDark ? const Color(0xFFFF4D4D) : const Color(0xFFFFC800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
