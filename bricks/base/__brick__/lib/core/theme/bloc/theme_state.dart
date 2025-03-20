abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  final bool isDark;
  ThemeInitial({this.isDark = false});
}

class ThemeChanged extends ThemeState {
  final bool isDark;
  ThemeChanged(this.isDark);
} 