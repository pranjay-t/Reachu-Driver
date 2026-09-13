import 'package:flutter/material.dart';

/// A reusable, theme-aware button widget supporting Primary, Secondary,
/// and Outlined variants with built-in loading state.
///
/// Usage:
/// ```dart
/// AppButton(
///   label: 'Login',
///   onPressed: () {},
/// )
/// ```
enum AppButtonVariant { primary, secondary, outlined }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isExpanded;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.isExpanded = true,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = isLoading ? null : onPressed;

    Widget child = _buildChild(context);

    switch (variant) {
      case AppButtonVariant.primary:
        return SizedBox(
          width: isExpanded ? double.infinity : null,
          child: ElevatedButton(
            onPressed: effectiveOnPressed,
            child: child,
          ),
        );

      case AppButtonVariant.secondary:
        return SizedBox(
          width: isExpanded ? double.infinity : null,
          child: TextButton(
            onPressed: effectiveOnPressed,
            child: child,
          ),
        );

      case AppButtonVariant.outlined:
        return SizedBox(
          width: isExpanded ? double.infinity : null,
          child: OutlinedButton(
            onPressed: effectiveOnPressed,
            child: child,
          ),
        );
    }
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AppButtonVariant.primary
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    final List<Widget> children = [];

    if (prefixIcon != null) {
      children.add(Icon(prefixIcon, size: 20));
      children.add(const SizedBox(width: 8));
    }

    children.add(Text(label));

    if (suffixIcon != null) {
      children.add(const SizedBox(width: 8));
      children.add(Icon(suffixIcon, size: 20));
    }

    if (children.length == 1) return children.first;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
