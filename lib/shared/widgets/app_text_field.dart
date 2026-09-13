import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/app_colors.dart';

/// A reusable, theme-aware text field widget wrapping [TextFormField].
///
/// Supports prefix/suffix icons, password visibility toggle, and validation.
/// Automatically picks up styling from the app's [InputDecorationTheme].
///
/// Usage:
/// ```dart
/// AppTextField(
///   label: 'Email',
///   hint: 'Enter your email',
///   prefixIcon: Icons.email_outlined,
///   validator: (v) => v!.isEmpty ? 'Required' : null,
/// )
/// ```
class AppTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool autofocus;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final Color? fillColor;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final VoidCallback? onTap;
  final InputBorder? border;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.autofillHints,
    this.contentPadding,
    this.isDense,
    this.fillColor,
    this.style,
    this.labelStyle,
    this.floatingLabelStyle,
    this.onTap,
    this.border,
    this.inputFormatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscured;
  FocusNode? _localFocusNode;
  bool _hasFocus = false;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? (_localFocusNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscureText;
    _effectiveFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_effectiveFocusNode.hasFocus != _hasFocus) {
      setState(() {
        _hasFocus = _effectiveFocusNode.hasFocus;
      });
    }
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.removeListener(_handleFocusChange);
      _localFocusNode?.removeListener(_handleFocusChange);
      _localFocusNode?.dispose();
      _localFocusNode = null;
      _effectiveFocusNode.addListener(_handleFocusChange);
      _hasFocus = _effectiveFocusNode.hasFocus;
    }
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_handleFocusChange);
    _localFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final baseFillColor = widget.fillColor ?? (isDark ? AppColors.darkSurface02 : AppColors.lightSurface02);

    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(
        color: isDark ? AppColors.neutral700 : AppColors.neutral300,
        width: 1,
      ),
    );

    final activeBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
        width: 1.8,
      ),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(
        color: theme.colorScheme.error,
        width: 1.0,
      ),
    );

    final focusedErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(
        color: theme.colorScheme.error,
        width: 1.8,
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: _hasFocus && widget.enabled
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: isDark ? 0.15 : 0.08),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        obscureText: _obscured,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: _effectiveFocusNode,
        autofocus: widget.autofocus,
        autofillHints: widget.autofillHints,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
        style: widget.style ?? theme.textTheme.bodyLarge?.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: widget.labelStyle ?? TextStyle(
            fontSize: 14.sp,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: widget.floatingLabelStyle ?? TextStyle(
            fontSize: 12.sp,
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          fillColor: baseFillColor,
          hintText: widget.hint,
          hintStyle: theme.textTheme.bodyLarge?.copyWith(
            color: isDark ? AppColors.neutral500 : AppColors.neutral400,
            fontSize: 14.sp,
          ),
          counterText: '',
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon != null
              ? AnimatedScale(
                  scale: _hasFocus ? 1.08 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    widget.prefixIcon,
                    size: 20.r,
                    color: _hasFocus 
                        ? theme.colorScheme.primary 
                        : (isDark ? AppColors.neutral400 : AppColors.neutral500),
                  ),
                )
              : null,
          suffixIcon: _buildSuffix(),
          contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          isDense: widget.isDense ?? true,
          border: widget.border ?? defaultBorder,
          enabledBorder: widget.border ?? defaultBorder,
          focusedBorder: widget.border ?? activeBorder,
          errorBorder: widget.border ?? errorBorder,
          focusedErrorBorder: widget.border ?? focusedErrorBorder,
        ),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 20.r,
        ),
        onPressed: () => setState(() => _obscured = !_obscured),
        splashRadius: 20.r,
      );
    }
    return widget.suffix;
  }
}
