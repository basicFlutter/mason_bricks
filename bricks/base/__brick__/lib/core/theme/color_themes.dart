import 'package:flutter/material.dart';


/// تعریف رنگ‌های اضافی برای حالت روشن
class LightColorThemes {
  static final appAdditionalColors = AppAdditionalColorsEx(
    success50: Color(0xffECFDF3),
    success700: Color(0xff027A48),
    warningBackground: Color(0xffFFF5DA),
    warning: Color(0xffF1A500),
    error700: Color(0xffB42318),
    error50: Color(0xffFEF3F2),
    backgroundtritary: Color(0xffFDFAF3),
    lightBackgroundSubded: Color(0xffFBDBDE3),
    lightBackgroundSubdedplus: Color(0xffFCF6F8),
    secondaryErrorText: Color(0xff9F2626),
  );
}

/// تعریف رنگ‌های اضافی برای حالت تاریک
class DarkColorThemes {
  static final appAdditionalColors = AppAdditionalColorsEx(
    success50: Color(0xffECFDF3),
    success700: Color(0xff027A48),
    warningBackground: Color(0xffFFF5DA),
    warning: Color(0xffF1A500),
    error700: Color(0xffB42318),
    error50: Color(0xffFEF3F2),
    backgroundtritary: Color(0xffFDFAF3),
    lightBackgroundSubded: Color(0xffFBDBDE3),
    lightBackgroundSubdedplus: Color(0xffFCF6F8),
    secondaryErrorText: Color(0xff9F2626),
  );
}


class AppAdditionalColorsEx extends ThemeExtension<AppAdditionalColorsEx> {
  const AppAdditionalColorsEx({
    required this.success50,
    required this.success700,
    required this.error50,
    required this.error700,
    required this.warning,
    required this.warningBackground,
    required this.backgroundtritary,
    required this.lightBackgroundSubdedplus,
    required this.lightBackgroundSubded,
    required this.secondaryErrorText,
  });

  // رنگ‌های موفقیت
  final Color success50;
  final Color success700;

  // رنگ‌های خطا
  final Color error50;
  final Color error700;
  final Color secondaryErrorText;

  // رنگ‌های هشدار
  final Color warning;
  final Color warningBackground;

  // رنگ‌های پس‌زمینه
  final Color backgroundtritary;
  final Color lightBackgroundSubdedplus;
  final Color lightBackgroundSubded;

  @override
  ThemeExtension<AppAdditionalColorsEx> lerp(AppAdditionalColorsEx? other, double t) {
    if (other is! AppAdditionalColorsEx) {
      return this;
    }
    return AppAdditionalColorsEx(
      success700: Color.lerp(success700, other.success700, t)!,
      success50: Color.lerp(success50, other.success50, t)!,
      error50: Color.lerp(error50, other.error50, t)!,
      error700: Color.lerp(error700, other.error700, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningBackground: Color.lerp(warningBackground, other.warningBackground, t)!,
      backgroundtritary: Color.lerp(backgroundtritary, other.backgroundtritary, t)!,
      lightBackgroundSubded: Color.lerp(lightBackgroundSubded, other.lightBackgroundSubded, t)!,
      lightBackgroundSubdedplus: Color.lerp(lightBackgroundSubdedplus, other.lightBackgroundSubdedplus, t)!,
      secondaryErrorText: Color.lerp(secondaryErrorText, other.secondaryErrorText, t)!,
    );
  }

  @override
  AppAdditionalColorsEx copyWith({
    Color? success50,
    Color? success700,
    Color? error50,
    Color? error700,
    Color? warning,
    Color? warningBackground,
    Color? backgroundtritary,
    Color? lightBackgroundSubdedplus,
    Color? lightBackgroundSubded,
    Color? secondaryErrorText,
  }) {
    return AppAdditionalColorsEx(
      success50: success50 ?? this.success50,
      success700: success700 ?? this.success700,
      error50: error50 ?? this.error50,
      error700: error700 ?? this.error700,
      warning: warning ?? this.warning,
      warningBackground: warningBackground ?? this.warningBackground,
      backgroundtritary: backgroundtritary ?? this.backgroundtritary,
      lightBackgroundSubdedplus: lightBackgroundSubdedplus ?? this.lightBackgroundSubdedplus,
      lightBackgroundSubded: lightBackgroundSubded ?? this.lightBackgroundSubded,
      secondaryErrorText: secondaryErrorText ?? this.secondaryErrorText,
    );
  }
}