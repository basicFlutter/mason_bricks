import "package:flutter/material.dart";
import "text_themes.dart";
import "color_themes.dart";

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    extensions: [
      LightColorThemes.appAdditionalColors,
      LightTextThemes.appTextTheme,
    ],
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    fontFamily: "IranSans",
    primaryColor: Colors.blueGrey,
    useMaterial3: true,
    iconTheme: IconThemeData(color: Colors.grey[700]),
  );

  static ThemeData darkTheme = ThemeData(
    extensions: [
      DarkColorThemes.appAdditionalColors,
      DarkTextThemes.appTextTheme,
    ],
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    fontFamily: "IranSans",
    primaryColor: Colors.blueGrey,
    useMaterial3: true,
    iconTheme: IconThemeData(color: Colors.grey[300]),
  );
} 