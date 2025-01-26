import '/../library.dart';

extension ThemeExtensions on ThemeData {
  Color getColorAppTheme({required Color lightColor, required Color darkColor}) {
    return brightness == Brightness.light ? lightColor : darkColor;
  }

  BoxShadow getShadowAppTheme({required BoxShadow shadowLight, required BoxShadow shadowDark}) {
    return brightness == Brightness.light ? shadowLight : shadowDark;
  }

}