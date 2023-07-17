part of 'settings_bloc.dart';

class SettingsState {
  final ThemeData themeData;
  final bool isSystemTheme;
  final bool isDark;
  final double textScale;

  SettingsState.empty(
    this.themeData,
    this.isSystemTheme,
    this.isDark,
    this.textScale,
  );

  SettingsState copyWith({
    ThemeData? themeData,
    bool? isSystemTheme,
    bool? isDark,
    double? textScale,
  }) {
    return SettingsState.empty(
      themeData ?? this.themeData,
      isSystemTheme ?? this.isSystemTheme,
      isDark ?? this.isDark,
      textScale??this.textScale,
    );
  }
}
