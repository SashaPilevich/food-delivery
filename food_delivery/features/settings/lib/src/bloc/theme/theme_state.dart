part of 'theme_bloc.dart';

class ThemeState {
  final ThemeData themeData;
  final bool isSystemTheme;
  final bool isDark;

  ThemeState.empty(
    this.themeData,
    this.isSystemTheme,
    this.isDark,
  );

  ThemeState copyWith({
    ThemeData? themeData,
    bool? isSystemTheme,
    bool? isDark,
  }) {
    return ThemeState.empty(
      themeData ?? this.themeData,
      isSystemTheme ?? this.isSystemTheme,
      isDark ?? this.isDark,
    );
  }
}
