import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // Theme Extensions
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  
  // Media Query Extensions
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  
  // Navigation Extensions
  NavigatorState get navigator => Navigator.of(this);
  
  // Responsive Extensions
  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 900;
  bool get isDesktop => width >= 900;
  
  // Screen Size Extensions
  bool get isSmallScreen => width < 400;
  bool get isMediumScreen => width >= 400 && width < 800;
  bool get isLargeScreen => width >= 800;
  
  // Orientation Extensions
  bool get isPortrait => height > width;
  bool get isLandscape => width > height;
  
  // Device Type Extensions
  bool get isPhone => height < 600;
  bool get isTabletDevice => height >= 600 && height < 900;
  bool get isDesktopDevice => height >= 900;
} 