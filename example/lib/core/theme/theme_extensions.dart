import 'package:flutter/material.dart';
import 'color_themes.dart';
import 'text_themes.dart';

/// اکستنشن‌های مربوط به ThemeData
extension AppThemeExtension on ThemeData {
  /// دسترسی به رنگ‌های سفارشی
  /// مثال: Theme.of(context).appColors
  AppColorsTheme get appColors => extension<AppColorsTheme>() ?? LightColorThemes.appAdditionalColors;

  /// دسترسی به استایل‌های متنی سفارشی
  /// مثال: Theme.of(context).appTextTheme
  AppTextTheme get appTextTheme => extension<AppTextTheme>() ?? LightTextThemes.appTextTheme;
}

/// اکستنشن‌های مربوط به BuildContext
extension ThemeGetter on BuildContext {
  /// دسترسی به ThemeData
  /// مثال: context.theme
  ThemeData get theme => Theme.of(this);

  /// دسترسی به رنگ‌های سفارشی
  /// مثال: context.appColors
  AppColorsTheme get appColors => theme.appColors;

  /// دسترسی به استایل‌های متنی سفارشی
  /// مثال: context.appTextTheme
  AppTextTheme get appTextTheme => theme.appTextTheme;
} 