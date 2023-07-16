part of 'theme_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class InitTheme extends ThemeEvent {
  InitTheme();
}

class ChangeThemeType extends ThemeEvent {
  final bool isSystemTheme;

  ChangeThemeType({
    required this.isSystemTheme,
  });
}

class ChangeThemeMode extends ThemeEvent {
  final bool isDark;

  ChangeThemeMode({
    required this.isDark,
  });
}
