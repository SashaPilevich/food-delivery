part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class InitSettings extends SettingsEvent {
  InitSettings();
}

class ChangeThemeType extends SettingsEvent {
  final bool isSystemTheme;

  ChangeThemeType({
    required this.isSystemTheme,
  });
}

class ChangeThemeMode extends SettingsEvent {
  final bool isDark;

  ChangeThemeMode({
    required this.isDark,
  });
}

class ChangeFontSize extends SettingsEvent {
  final double textScale;

  ChangeFontSize({
    required this.textScale,
  });
}

