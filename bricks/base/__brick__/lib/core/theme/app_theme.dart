
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "/../core/AppTheme/color_AppTheme.dart";
import "app_colors.dart";


class AppTheme {
  static ThemeData lightTheme = ThemeData(

    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    // fontFamily: "publicSans-variable",
    fontFamily: "IranSans",
    primaryColor: ColorAppTheme.primaryLight,
    useMaterial3: true,

    searchBarTheme: SearchBarThemeData(
      backgroundColor:MaterialStateProperty.all(AppColors.primary3),
    ),




    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor:AppColors.primary,
    //
    //
    //   elevation: 0,
    //
    //   selectedIconTheme: IconThemeData(
    //       color: AppColors.white,
    //       size: 28.r
    //   ),
    //   unselectedIconTheme: IconThemeData(
    //       color:AppColors.white,
    //       size: 28.r
    //   ),
    //   selectedLabelAppTheme: TextAppTheme(
    //       color: AppColors.hint,
    //       fontSize:11.sp,
    //       fontVariations: const [
    //         FontVariation(
    //             'wght', 600
    //         )
    //       ]
    //   ),
    //   unselectedLabelAppTheme: TextAppTheme(
    //       color: AppColors.white,
    //       fontSize: 12.sp,
    //
    //       fontVariations: const [
    //         FontVariation(
    //             'wght', 400
    //         )
    //       ]
    //
    //   ),
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   checkColor: MaterialStateProperty.all(AppColors.white),
    //
    //   fillColor: MaterialStateProperty.all(Colors.transparent),
    //   shape: const CircleBorder(),
    // ),




    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(

      displayLarge:  TextAppTheme(
        fontSize: 13.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        color: ColorAppTheme.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displayMedium:  TextAppTheme(
        fontSize: 12.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        color: ColorAppTheme.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displaySmall:   TextAppTheme(
        fontSize: 11.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),



      titleLarge:  TextAppTheme(
        fontSize: 20.sp,
        decoration: TextDecoration.none,

        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),


      titleMedium: TextAppTheme(
        fontSize: 19.sp,
        decoration: TextDecoration.none,

        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),


      titleSmall:   TextAppTheme(
        fontSize: 18.sp,
        decoration: TextDecoration.none,

        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),



      bodyLarge: TextAppTheme(
        fontSize: 10.sp,
        decoration: TextDecoration.none,
        color: ColorAppTheme.darkLight,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      bodyMedium: TextAppTheme(
      fontSize: 9.sp,
      decoration: TextDecoration.none,
      fontAppTheme: FontAppTheme.normal,
        color: ColorAppTheme.darkLight,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
      bodySmall: TextAppTheme(
        fontSize: 8.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        color: ColorAppTheme.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),


      labelLarge:  TextAppTheme(
        fontSize: 16.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),

      labelMedium:  TextAppTheme(
        fontSize: 15.sp,
        decoration: TextDecoration.none,
        color: ColorAppTheme.darkLight,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),

      labelSmall:  TextAppTheme(
        fontSize: 14.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
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
    primaryColor: ColorAppTheme.primaryDark,

    searchBarTheme: SearchBarThemeData(
      backgroundColor:MaterialStateProperty.all(AppColors.primary3),
    ),



    //
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor:AppColors.primary,
    //
    //
    //   elevation: 0,
    //
    //   selectedIconTheme: IconThemeData(
    //       color: AppColors.white,
    //       size: 28.r
    //   ),
    //   unselectedIconTheme: IconThemeData(
    //       color:AppColors.white,
    //       size: 28.r
    //   ),
    //   selectedLabelAppTheme: TextAppTheme(
    //       color: AppColors.hint,
    //       fontSize:11.sp,
    //       fontVariations: const [
    //         FontVariation(
    //             'wght', 600
    //         )
    //       ]
    //   ),
    //   unselectedLabelAppTheme: TextAppTheme(
    //       color: AppColors.white,
    //       fontSize: 12.sp,
    //
    //       fontVariations: const [
    //         FontVariation(
    //             'wght', 400
    //         )
    //       ]
    //
    //   ),
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   checkColor: MaterialStateProperty.all(AppColors.white),
    //
    //   fillColor: MaterialStateProperty.all(Colors.transparent),
    //   shape: const CircleBorder(),
    // ),
    //



    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(

      displayLarge:  TextAppTheme(
        fontSize: 13.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        color: ColorAppTheme.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displayMedium:  TextAppTheme(
        fontSize: 12.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        color: ColorAppTheme.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      displaySmall:   TextAppTheme(
        fontSize: 11.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),



      titleLarge:  TextAppTheme(
        fontSize: 20.sp,
        decoration: TextDecoration.none,

        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),


      titleMedium: TextAppTheme(
        fontSize: 19.sp,
        decoration: TextDecoration.none,

        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),


      titleSmall:   TextAppTheme(
        fontSize: 18.sp,
        decoration: TextDecoration.none,

        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),



      bodyLarge: TextAppTheme(
        fontSize: 10.sp,
        decoration: TextDecoration.none,
        color: ColorAppTheme.darkLight,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      bodyMedium: TextAppTheme(
        fontSize: 9.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        color: ColorAppTheme.darkLight,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),


      labelLarge:  TextAppTheme(
        fontSize: 16.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),

      labelMedium:  TextAppTheme(
        fontSize: 15.sp,
        decoration: TextDecoration.none,
        color: ColorAppTheme.darkLight,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),

      labelSmall:  TextAppTheme(
        fontSize: 14.sp,
        decoration: TextDecoration.none,
        fontAppTheme: FontAppTheme.normal,
        fontWeight: FontWeight.w400,
        color: ColorAppTheme.darkLight,
        letterSpacing: 0,
      ),
    ),
  );
}
