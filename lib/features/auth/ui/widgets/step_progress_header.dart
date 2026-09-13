import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class StepProgressHeader extends StatelessWidget {
  final int currentGroupIndex; // 0: Personal, 1: DL, 2: Identity, 3: Vehicle
  final double percentage;
  final String activeStepLabel;
  final Function(int)? onGroupTap;

  const StepProgressHeader({
    super.key,
    required this.currentGroupIndex,
    required this.percentage,
    required this.activeStepLabel,
    this.onGroupTap,
  });

  static const List<Map<String, dynamic>> groups = [
    {'title': 'Personal', 'icon': Icons.person_rounded},
    {'title': 'License', 'icon': Icons.badge_rounded},
    {'title': 'Identity', 'icon': Icons.fingerprint_rounded},
    {'title': 'Vehicle', 'icon': Icons.directions_car_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark
              ? AppColors.neutral800.withValues(alpha: 0.6)
              : AppColors.neutral200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Active Label & Glowing Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary500,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary500.withValues(alpha: 0.6),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'STEP ${currentGroupIndex + 1} OF 4',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.primary500,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    activeStepLabel,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),

              // Progress Pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary500.withValues(alpha: 0.15),
                      AppColors.primary600.withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary500.withValues(alpha: 0.3),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      percentage >= 100 ? Icons.verified_rounded : Icons.electric_bolt_rounded,
                      size: 16,
                      color: AppColors.primary500,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${percentage.toInt()}%',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.primary500,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Glowing Linear Progress Track
          LayoutBuilder(
            builder: (context, constraints) {
              final fillWidth = (constraints.maxWidth * (percentage / 100).clamp(0.0, 1.0));
              return Stack(
                children: [
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface03 : AppColors.neutral200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    height: 10,
                    width: fillWidth,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primary400,
                          AppColors.primary600,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary500.withValues(alpha: 0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 22),

          // Connected Stepper Nodes
          Stack(
            alignment: Alignment.center,
            children: [
              // Track Connecting Line
              Positioned(
                left: 28,
                right: 28,
                top: 24,
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface03 : AppColors.neutral200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(groups.length, (index) {
                  final isCompleted = index < currentGroupIndex;
                  final isCurrent = index == currentGroupIndex;
                  final item = groups[index];

                  BoxDecoration nodeDecoration;
                  Color iconColor;
                  Color textColor;

                  if (isCompleted) {
                    nodeDecoration = const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF047857)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x5510B981),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    );
                    iconColor = Colors.white;
                    textColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
                  } else if (isCurrent) {
                    nodeDecoration = BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary400, AppColors.primary600],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary500.withValues(alpha: 0.6),
                          blurRadius: 14,
                          spreadRadius: 3,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    );
                    iconColor = Colors.white;
                    textColor = AppColors.primary500;
                  } else {
                    nodeDecoration = BoxDecoration(
                      color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark ? AppColors.neutral700 : AppColors.neutral300,
                        width: 1.5,
                      ),
                    );
                    iconColor = isDark ? AppColors.neutral500 : AppColors.neutral400;
                    textColor = isDark ? AppColors.neutral500 : AppColors.neutral400;
                  }

                  Widget nodeIconWidget = AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 48,
                    height: 48,
                    decoration: nodeDecoration,
                    child: Icon(
                      isCompleted ? Icons.check_rounded : (item['icon'] as IconData),
                      size: 22,
                      color: iconColor,
                    ),
                  );

                  if (isCurrent) {
                    nodeIconWidget = nodeIconWidget
                        .animate(onPlay: (c) => c.repeat(reverse: true))
                        .scale(
                          begin: const Offset(1.0, 1.0),
                          end: const Offset(1.06, 1.06),
                          duration: 1200.ms,
                        );
                  }

                  return GestureDetector(
                    onTap: onGroupTap != null ? () => onGroupTap!(index) : null,
                    child: Column(
                      children: [
                        nodeIconWidget,
                        const SizedBox(height: 8),
                        Text(
                          item['title'] as String,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: textColor,
                            fontWeight: isCurrent || isCompleted ? FontWeight.w800 : FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
