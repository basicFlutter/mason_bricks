import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_themes.dart';

/// تعریف تم‌های متنی برای حالت روشن
class LightTextThemes {
  static final appTextTheme = AppTextTheme(
    body1: TextStyle(
      fontSize: 14.sp,
      color: LightColorThemes.appAdditionalColors.error50,
      fontWeight: FontWeight.w400,
    ),
    h1: TextStyle(
      fontSize: 24.sp,
      color: LightColorThemes.appAdditionalColors.error50,
      fontWeight: FontWeight.bold,
    ),
  );
}

/// تعریف تم‌های متنی برای حالت تاریک
class DarkTextThemes {
  static final appTextTheme = AppTextTheme(
    body1: TextStyle(
      fontSize: 14.sp,
      color: DarkColorThemes.appAdditionalColors.error50,
      fontWeight: FontWeight.w400,
    ),
    h1: TextStyle(
      fontSize: 24.sp,
      color: DarkColorThemes.appAdditionalColors.error50,
      fontWeight: FontWeight.bold,
    ),
  );
}

/// اکستنشن برای مدیریت استایل‌های متنی سفارشی
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  const AppTextTheme({
    required this.body1,
    required this.h1,
  });

  final TextStyle body1;
  final TextStyle h1;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? body1,
    TextStyle? h1,
  }) {
    return AppTextTheme(
      body1: body1 ?? this.body1,
      h1: h1 ?? this.h1,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
      covariant ThemeExtension<AppTextTheme>? other,
      double t,
      ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme(
      body1: TextStyle.lerp(body1, other.body1, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
    );
  }
} 