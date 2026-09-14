import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/app_colors.dart';

/// A premium, theme-aware custom dropdown field that opens an overlay menu
/// directly below the field. Implements [FormField] for easy form validation.
class AppDropdown<T> extends FormField<T> {
  final List<T> items;
  final String Function(T) itemLabel;
  final String? hint;
  final String? label;
  final ValueChanged<T?>? onChanged;
  final IconData? prefixIcon;

  AppDropdown({
    super.key,
    required this.items,
    required this.itemLabel,
    this.hint,
    this.label,
    super.initialValue,
    this.onChanged,
    super.validator,
    this.prefixIcon,
    super.enabled = true,
  }) : super(
          builder: (FormFieldState<T> fieldState) {
            final state = fieldState as _AppDropdownState<T>;
            return state.buildWidget();
          },
        );

  @override
  FormFieldState<T> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends FormFieldState<T>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();
  final Object _tapRegionGroupId = Object();
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isOpen = false;

  @override
  AppDropdown<T> get widget => super.widget as AppDropdown<T>;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(covariant AppDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setValue(widget.initialValue);
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeDropdown() {
    if (!_isOpen) return;
    setState(() {
      _isOpen = false;
    });
    _animationController.reverse().then((_) {
      if (mounted) {
        _overlayController.hide();
      }
    });
  }

  void _openDropdown() {
    if (!widget.enabled || _isOpen) return;
    setState(() {
      _isOpen = true;
    });
    _overlayController.show();
    _animationController.forward();

    // Auto-scroll the enclosing Scrollable so the dropdown and its overlay menu are fully visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Scrollable.ensureVisible(
          context,
          alignment: 0.12,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _toggleDropdown() {
    if (!widget.enabled) return;
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  Widget buildWidget() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final hasErrorState = hasError;
    final valueText = value != null ? widget.itemLabel(value as T) : null;

    final baseFillColor = isDark ? AppColors.darkSurface02 : AppColors.lightSurface02;
    final focusFillColor = isDark ? AppColors.darkSurface03 : AppColors.lightSurface00;

    final borderColor = hasErrorState
        ? theme.colorScheme.error
        : (_isOpen
            ? theme.colorScheme.primary
            : (isDark ? AppColors.neutral700 : AppColors.neutral300));

    return CompositedTransformTarget(
      link: _layerLink,
      child: TapRegion(
        groupId: _tapRegionGroupId,
        behavior: HitTestBehavior.opaque,
        onTapOutside: (event) {
          if (_isOpen) {
            _closeDropdown();
          }
        },
        child: OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: _buildMenu,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _toggleDropdown,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: _isOpen ? focusFillColor : baseFillColor,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: borderColor,
                      width: _isOpen ? 1.8 : 1.0,
                    ),
                    boxShadow: _isOpen && widget.enabled
                        ? [
                            BoxShadow(
                              color: theme.colorScheme.primary
                                  .withValues(alpha: isDark ? 0.15 : 0.08),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                  child: Row(
                    children: [
                      if (widget.prefixIcon != null) ...[
                        AnimatedScale(
                          scale: _isOpen ? 1.08 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            widget.prefixIcon,
                            size: 20.r,
                            color: _isOpen
                                ? theme.colorScheme.primary
                                : (isDark ? AppColors.neutral400 : AppColors.neutral500),
                          ),
                        ),
                        SizedBox(width: 12.w),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.label != null &&
                                (value != null || _isOpen))
                              Text(
                                widget.label!,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: hasErrorState
                                      ? theme.colorScheme.error
                                      : (_isOpen
                                          ? theme.colorScheme.primary
                                          : (isDark
                                              ? AppColors.darkTextSecondary
                                              : AppColors.lightTextSecondary)),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            Text(
                              valueText ?? widget.hint ?? '',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: value != null
                                    ? (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary)
                                    : (isDark ? AppColors.neutral500 : AppColors.neutral400),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RotationTransition(
                        turns: Tween(begin: 0.0, end: 0.5)
                            .animate(_expandAnimation),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 22.r,
                          color: _isOpen
                              ? theme.colorScheme.primary
                              : (isDark ? AppColors.neutral400 : AppColors.neutral500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (hasErrorState)
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 6.h),
                  child: Text(
                    errorText ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final menuBackground = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;
    final borderThemeColor = isDark ? AppColors.neutral700 : AppColors.neutral300;

    return CompositedTransformFollower(
      link: _layerLink,
      showWhenUnlinked: false,
      targetAnchor: Alignment.bottomLeft,
      followerAnchor: Alignment.topLeft,
      offset: Offset(0, 4.h),
      child: TapRegion(
        groupId: _tapRegionGroupId,
        behavior: HitTestBehavior.opaque,
        child: FadeTransition(
          opacity: _expandAnimation,
          child: SizeTransition(
            sizeFactor: _expandAnimation,
            axisAlignment: -1.0,
            child: Material(
              elevation: 8,
              color: Colors.transparent,
              child: Container(
                width: _layerLink.leaderSize?.width,
                constraints: BoxConstraints(
                  maxHeight: 250.h,
                ),
                decoration: BoxDecoration(
                  color: menuBackground,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: borderThemeColor,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: widget.items.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: isDark ? AppColors.neutral800 : AppColors.neutral100,
                    ),
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      final isSelected = value == item;
                      final label = widget.itemLabel(item);

                      return InkWell(
                        onTap: () {
                          didChange(item);
                          if (widget.onChanged != null) {
                            widget.onChanged!(item);
                          }
                          _closeDropdown();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 14.h),
                          color: isSelected
                              ? theme.colorScheme.primary.withValues(alpha: isDark ? 0.15 : 0.08)
                              : null,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  label,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: isSelected
                                        ? theme.colorScheme.primary
                                        : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Icon(
                                  Icons.check_circle,
                                  size: 18.r,
                                  color: theme.colorScheme.primary,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
