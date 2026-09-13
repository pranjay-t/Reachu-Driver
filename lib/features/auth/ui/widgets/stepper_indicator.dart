import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:reachu_driver/core/utils/screen_safe_extensions.dart';
import '../../../../app/theme/app_colors.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const StepperIndicator({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Connecting Line
          final stepIndex = index ~/ 2;
          final isCompleted = stepIndex < currentStep;
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: (18.rSafe - 1.5.hSafe).clamp(0.0, double.infinity),
                ), // 18.rSafe is half the circle size (36.rSafe), 1.5.hSafe is half the line height (3.hSafe)
                AnimatedDashedLine(isCompleted: isCompleted, isDark: isDark),
              ],
            ),
          );
        }

        // Step Circle Node
        final stepIndex = index ~/ 2;
        final isActive = stepIndex == currentStep;
        final isCompleted = stepIndex < currentStep;

        Widget circle = AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 36.rSafe,
          height: 36.rSafe,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isActive || isCompleted
                ? const LinearGradient(
                    colors: [AppColors.primary500, AppColors.primary700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: !isActive && !isCompleted
                ? (isDark ? AppColors.darkSurface02 : AppColors.lightSurface02)
                : null,
            border: Border.all(
              color: isActive
                  ? Colors.white
                  : (isCompleted
                        ? AppColors.primary700
                        : (isDark
                              ? AppColors.darkDivider
                              : AppColors.lightDivider)),
              width: isActive ? 2 : 1,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: AppColors.primary500.withValues(alpha: 0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    '${stepIndex + 1}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isActive
                          ? Colors.white
                          : (isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );

        if (isActive) {
          circle = circle
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(1.0, 1.0),
                end: const Offset(1.08, 1.08),
                duration: 1200.ms,
                curve: Curves.easeInOut,
              );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            circle,
            const SizedBox(height: 6),
            Text(
              steps[stepIndex],
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isActive
                    ? AppColors.primary500
                    : (isCompleted
                          ? (isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary)
                          : AppColors.neutral500),
                fontWeight: isActive || isCompleted
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 10.spSafe,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class AnimatedDashedLine extends StatefulWidget {
  final bool isCompleted;
  final bool isDark;

  const AnimatedDashedLine({
    super.key,
    required this.isCompleted,
    required this.isDark,
  });

  @override
  State<AnimatedDashedLine> createState() => _AnimatedDashedLineState();
}

class _AnimatedDashedLineState extends State<AnimatedDashedLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    if (widget.isCompleted) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedDashedLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isCompleted != oldWidget.isCompleted) {
      if (widget.isCompleted) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inactiveColor = widget.isDark
        ? AppColors.darkDivider
        : AppColors.lightDivider;
    final activeColor = AppColors.primary500;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          height: 3.hSafe,
          child: CustomPaint(
            size: Size(double.infinity, 3.hSafe),
            painter: DashedLinePainter(
              inactiveColor: inactiveColor,
              activeColor: activeColor,
              progress: _animation.value,
            ),
          ),
        );
      },
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color inactiveColor;
  final Color activeColor;
  final double progress;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;

  DashedLinePainter({
    required this.inactiveColor,
    required this.activeColor,
    required this.progress,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final inactivePaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final activePaint = Paint()
      ..color = activeColor
      ..strokeWidth = strokeWidth + 0.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw inactive dashed line
    double startX = 0;
    while (startX < size.width) {
      final endX = (startX + dashWidth).clamp(0.0, size.width);
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(endX, size.height / 2),
        inactivePaint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw active dashed line on top based on progress
    if (progress > 0) {
      startX = 0;
      final double activeMaxW = size.width * progress;
      while (startX < activeMaxW) {
        final endX = (startX + dashWidth).clamp(0.0, activeMaxW);
        canvas.drawLine(
          Offset(startX, size.height / 2),
          Offset(endX, size.height / 2),
          activePaint,
        );
        startX += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedLinePainter oldDelegate) {
    return oldDelegate.inactiveColor != inactiveColor ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.progress != progress ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
