import '/../library.dart';

extension ThemeExtensions on ThemeData {
  Color getColorStyle({required Color lightColor, required Color darkColor}) {
    return brightness == Brightness.light ? lightColor : darkColor;
  }

  BoxShadow getShadowStyle({required BoxShadow shadowLight, required BoxShadow shadowDark}) {
    return brightness == Brightness.light ? shadowLight : shadowDark;
  }

}