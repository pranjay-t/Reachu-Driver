import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../../core/localization/locale_provider.dart';

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index, WidgetRef ref) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scaffoldBg = isDark ? AppColors.neutral950 : AppColors.lightSurface01;

    return Scaffold(
      backgroundColor: scaffoldBg,
      extendBody: true,
      body: Stack(
        children: [
          // 1. Cinematic Background Image with Gradient (COMMENTED OUT)
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
          //     child: Image.asset(
          //       'assets/images/home_bg.png',
          //       fit: BoxFit.cover,
          //       opacity: AlwaysStoppedAnimation(0.6),
          //     ),
          //   ),
          // ),
          // Positioned.fill(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           AppColors.neutral950.withValues(alpha: 0.85),
          //           AppColors.neutral950.withValues(alpha: 0.6),
          //           AppColors.neutral950.withValues(alpha: 0.95),
          //           AppColors.neutral950,
          //         ],
          //         stops: const [0.0, 0.3, 0.7, 1.0],
          //       ),
          //     ),
          //   ),
          // ),

          // 2. Foreground Content (The current active tab)
          navigationShell,
        ],
      ),
      bottomNavigationBar: _CustomBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _goBranch(index, ref),
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _CustomBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.paddingOf(context).bottom + 16.h,
        left: 24.w,
        right: 24.w,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 72.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.neutral900.withValues(alpha: 0.6)
                  : AppColors.lightSurface00.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(32.r),
              border: Border.all(
                color: isDark
                    ? AppColors.neutral700.withValues(alpha: 0.5)
                    : AppColors.neutral200.withValues(alpha: 0.8),
                width: 1,
              ),
              boxShadow: isDark
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 24,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarItem(
                  icon: Icons.home_rounded,
                  label: context.l10n.home,
                  isSelected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                _NavBarItem(
                  icon: Icons.assignment_rounded,
                  label: context.l10n.booking,
                  isSelected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                _NavBarItem(
                  icon: Icons.trending_up_rounded,
                  label: context.l10n.earning,
                  isSelected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
                _NavBarItem(
                  icon: Icons.headset_mic_rounded,
                  label: context.l10n.support,
                  isSelected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
                _NavBarItem(
                  icon: Icons.person_rounded,
                  label: context.l10n.profile,
                  isSelected: currentIndex == 4,
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isSelected
        ? AppColors.primary500
        : (isDark ? AppColors.neutral400 : AppColors.neutral500);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary500.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24.sp),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
