import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_theme.dart';
import 'color_themes.dart';
import 'text_themes.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  bool build() => false;

  void toggleTheme() {
    state = !state;
  }
}

final themeDataProvider = Provider<ThemeData>((ref) {
  final isDarkMode = ref.watch(themeProvider);
  
  return isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
});

final colorThemeProvider = Provider<AppColorsTheme>((ref) {
  final isDarkMode = ref.watch(themeProvider);
  
  return isDarkMode ? DarkColorThemes.appAdditionalColors : LightColorThemes.appAdditionalColors;
});

final textThemeProvider = Provider<AppTextTheme>((ref) {
  final isDarkMode = ref.watch(themeProvider);
  
  return isDarkMode ? DarkTextThemes.appTextTheme : LightTextThemes.appTextTheme;
}); 