import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extension methods on [num] to provide safe, crash-proof ScreenUtil dimensions.
///
/// If ScreenUtil is uninitialized (throwing a [LateInitializationError]) or
/// if the calculated values are [double.nan] or [double.infinity], these methods
/// will gracefully fall back to the original raw value.
extension ScreenSafeExtensions on num {
  /// Safe version of `.w` (width)
  double get wSafe {
    try {
      final val = ScreenUtil().setWidth(this);
      return val.isNaN || val.isInfinite ? toDouble() : val;
    } catch (_) {
      return toDouble();
    }
  }

  /// Safe version of `.h` (height)
  double get hSafe {
    try {
      final val = ScreenUtil().setHeight(this);
      return val.isNaN || val.isInfinite ? toDouble() : val;
    } catch (_) {
      return toDouble();
    }
  }

  /// Safe version of `.r` (radius)
  double get rSafe {
    try {
      final val = ScreenUtil().radius(this);
      return val.isNaN || val.isInfinite ? toDouble() : val;
    } catch (_) {
      return toDouble();
    }
  }

  /// Safe version of `.sp` (font size)
  double get spSafe {
    try {
      final val = ScreenUtil().setSp(this);
      return val.isNaN || val.isInfinite ? toDouble() : val;
    } catch (_) {
      return toDouble();
    }
  }
}
