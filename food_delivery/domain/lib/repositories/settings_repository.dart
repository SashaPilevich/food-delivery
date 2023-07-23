abstract class SettingsRepository {
  Future<bool> checkThemeMode();
  Future<bool> checkThemeType();
  Future<void> setThemeMode(bool isDark);
  Future<void> setThemeType(bool isSystemTheme);
  Future<double> checkFontSize();
  Future<void> setFontSize(double textScale);
}
