
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "../style/color_style.dart";


class AppTheme {
  static ThemeData lightTheme = ThemeData(

    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    // fontFamily: "publicSans-variable",
    fontFamily: "IranSans",
    primaryColor: ColorStyle.primaryLight,
    useMaterial3: true,

    searchBarTheme: SearchBarThemeData(
      backgroundColor:WidgetStateProperty.all(ColorStyle.primaryLight100),
    ),


    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(

      displayLarge:  TextStyle(
        fontSize: 13.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        color: ColorStyle.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displayMedium:  TextStyle(
        fontSize: 12.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        color: ColorStyle.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displaySmall:   TextStyle(
        fontSize: 11.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),



      titleLarge:  TextStyle(
        fontSize: 20.sp,
        decoration: TextDecoration.none,

        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),


      titleMedium: TextStyle(
        fontSize: 19.sp,
        decoration: TextDecoration.none,

        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),


      titleSmall:   TextStyle(
        fontSize: 18.sp,
        decoration: TextDecoration.none,

        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),



      bodyLarge: TextStyle(
        fontSize: 10.sp,
        decoration: TextDecoration.none,
        color: ColorStyle.darkLight,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 9.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        color: ColorStyle.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 8.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        color: ColorStyle.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),


      labelLarge:  TextStyle(
        fontSize: 16.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),

      labelMedium:  TextStyle(
        fontSize: 15.sp,
        decoration: TextDecoration.none,
        color: ColorStyle.darkLight,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),

      labelSmall:  TextStyle(
        fontSize: 14.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),
    ),

  );

  static ThemeData darkTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    // fontFamily: "publicSans-variable",
    fontFamily: "IranSans",
    primaryColor: ColorStyle.primaryDark,

    searchBarTheme: SearchBarThemeData(
      backgroundColor:MaterialStateProperty.all(ColorStyle.primaryLight100),
    ),
    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(

      displayLarge:  TextStyle(
        fontSize: 13.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        color: ColorStyle.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displayMedium:  TextStyle(
        fontSize: 12.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        color: ColorStyle.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displaySmall:   TextStyle(
        fontSize: 11.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),



      titleLarge:  TextStyle(
        fontSize: 20.sp,
        decoration: TextDecoration.none,

        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),


      titleMedium: TextStyle(
        fontSize: 19.sp,
        decoration: TextDecoration.none,

        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),


      titleSmall:   TextStyle(
        fontSize: 18.sp,
        decoration: TextDecoration.none,

        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),



      bodyLarge: TextStyle(
        fontSize: 10.sp,
        decoration: TextDecoration.none,
        color: ColorStyle.darkLight,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 9.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        color: ColorStyle.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),


      labelLarge:  TextStyle(
        fontSize: 16.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),

      labelMedium:  TextStyle(
        fontSize: 15.sp,
        decoration: TextDecoration.none,
        color: ColorStyle.darkLight,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),

      labelSmall:  TextStyle(
        fontSize: 14.sp,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: ColorStyle.darkLight,
        letterSpacing: 0,
      ),
    ),
  );
}
