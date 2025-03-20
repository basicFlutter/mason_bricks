abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class SetTheme extends ThemeEvent {
  final bool isDark;
  SetTheme(this.isDark);
} 