abstract class ThemeRepository {
  Future<bool> checkThemeMode();
  Future<bool> checkThemeType();
  Future<void> setThemeMode(bool isDark);
  Future<void> setThemeType(bool isSystemTheme);
}
