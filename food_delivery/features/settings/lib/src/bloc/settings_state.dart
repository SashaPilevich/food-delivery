part of 'settings_bloc.dart';

class SettingsState {
  final ThemeData themeData;
  final bool isSystemTheme;
  final bool isDark;
  final double textScale;

  SettingsState({
    required this.themeData,
    required this.isSystemTheme,
    required this.isDark,
    required this.textScale,
  });
  SettingsState.empty()
      : themeData = AppTheme.lightTheme,
        isSystemTheme = false,
        isDark = false,
        textScale = 1.0;

  SettingsState copyWith({
    ThemeData? themeData,
    bool? isSystemTheme,
    bool? isDark,
    double? textScale,
  }) {
    return SettingsState(
      themeData: themeData ?? this.themeData,
      isSystemTheme: isSystemTheme ?? this.isSystemTheme,
      isDark: isDark ?? this.isDark,
      textScale: textScale ?? this.textScale,
    );
  }
}
