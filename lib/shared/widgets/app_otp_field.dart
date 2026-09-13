import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_dimensions.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../core/utils/app_logger.dart';

// A reusable OTP input widget with individual digit boxes.
/// Supports configurable [length], auto-advance, paste handling,
/// and an [onCompleted] callback when all digits are filled.

class AppOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final String? value;

  const AppOtpField({
    super.key,
    this.length = 4,
    this.onCompleted,
    this.onChanged,
    this.value,
  });

  @override
  State<AppOtpField> createState() => _AppOtpFieldState();
}

class _AppOtpFieldState extends State<AppOtpField> with CodeAutoFill {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    AppLogger.i('AppOtpField: initState - Initializing controllers and nodes');
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());

    AppLogger.i('AppOtpField: initState - Calling listenForCode()');
    listenForCode();

    if (widget.value != null && widget.value!.isNotEmpty) {
      AppLogger.i(
        'AppOtpField: initState - Initial value found: "${widget.value}"',
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _handlePaste(widget.value!, 0);
        }
      });
    }
  }

  @override
  void didUpdateWidget(AppOtpField oldWidget) {
    super.didUpdateWidget(oldWidget);
    AppLogger.d(
      'AppOtpField: didUpdateWidget - value: "${widget.value}", old: "${oldWidget.value}"',
    );
    if (widget.value != oldWidget.value &&
        widget.value != null &&
        widget.value!.isNotEmpty) {
      AppLogger.i(
        'AppOtpField: didUpdateWidget - Value updated to "${widget.value}". Auto-filling.',
      );
      _handlePaste(widget.value!, 0);
    }
  }

  @override
  void codeUpdated() {
    AppLogger.i(
      'AppOtpField: codeUpdated - SMS code broadcast received: "$code"',
    );
    if (code != null && code!.isNotEmpty) {
      _handlePaste(code!, 0);
    } else {
      AppLogger.w('AppOtpField: codeUpdated - Received null/empty code');
    }
  }

  @override
  void dispose() {
    AppLogger.i(
      'AppOtpField: dispose - Cancelling listener and releasing resources',
    );
    cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _currentOtp => _controllers.map((c) => c.text).join();

  void _onChanged(int index, String value) {
    // Handle paste (multi-character input)
    if (value.length > 1) {
      _handlePaste(value, index);
      return;
    }

    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    final otp = _currentOtp;
    widget.onChanged?.call(otp);

    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  void _handlePaste(String value, int currentIndex) {
    AppLogger.i(
      'AppOtpField: _handlePaste called with value: "$value" at index: $currentIndex',
    );
    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');
    AppLogger.i('AppOtpField: Extracted digits: "$digits"');
    if (digits.isEmpty) {
      AppLogger.w('AppOtpField: Extracted digits is empty. Ignoring paste.');
      return;
    }

    final startIndex = digits.length >= widget.length ? 0 : currentIndex;
    AppLogger.i('AppOtpField: Starting paste at index: $startIndex');

    int lastFilledIndex = startIndex;
    for (int i = 0; i < digits.length; i++) {
      final targetIndex = startIndex + i;
      if (targetIndex < widget.length) {
        AppLogger.i('AppOtpField: Setting slot $targetIndex to "${digits[i]}"');
        _controllers[targetIndex].text = digits[i];
        _controllers[targetIndex].selection = const TextSelection.collapsed(
          offset: 1,
        );
        lastFilledIndex = targetIndex;
      }
    }

    setState(() {}); // Trigger rebuild to reflect filled text borders

    if (lastFilledIndex < widget.length - 1) {
      AppLogger.i(
        'AppOtpField: Requesting focus for slot ${lastFilledIndex + 1}',
      );
      _focusNodes[lastFilledIndex + 1].requestFocus();
    } else {
      AppLogger.i(
        'AppOtpField: Last slot filled. Requesting focus for last slot.',
      );
      _focusNodes[widget.length - 1].requestFocus();
    }

    final otp = _currentOtp;
    AppLogger.i('AppOtpField: Constructed OTP string: "$otp"');

    // Wrap state updates in a post-frame callback to avoid modifying providers during the widget build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onChanged?.call(otp);
        if (otp.length == widget.length) {
          AppLogger.i(
            'AppOtpField: OTP length matches widget length. Calling onCompleted callback.',
          );
          widget.onCompleted?.call(otp);
        }
      }
    });
  }

  void _onKeyEvent(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        final bool hasFocus = _focusNodes[index].hasFocus;
        final bool hasValue = _controllers[index].text.isNotEmpty;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: index == 0 || index == widget.length - 1
                ? 0
                : AppDimensions.space6,
          ),
          child: SizedBox(
            width: 56,
            height: 64,
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event) => _onKeyEvent(index, event),
              child: AnimatedContainer(
                duration: AppDimensions.durationFast,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSurface02
                      : AppColors.lightSurface02,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                  border: Border.all(
                    color: hasFocus || hasValue
                        ? AppColors.primary500
                        : isDark
                        ? AppColors.neutral700
                        : AppColors.neutral300,
                    width: hasFocus ? 2 : 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(widget.length),
                    ],
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: (value) => _onChanged(index, value),
                    onTap: () {
                      // Select all text on tap for easy replacement
                      _controllers[index].selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _controllers[index].text.length,
                      );
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
