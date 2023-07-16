part of 'theme_preferences_provider.dart';

class ThemePreferencesProviderImpl implements ThemePreferencesProvider {
  ThemePreferencesProviderImpl();

  @override
  Future<bool> getThemeMode() async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.get('isDark').toString() == 'true' ? true : false;
  }

  @override
  Future<bool> getThemeType() async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.get('isSystemTheme').toString() == 'true' ? true : false;
  }

  @override
  Future<void> setThemeMode(bool isDark) async {
    final Box themeBox = await Hive.openBox('theme');
    themeBox.put('isDark', isDark.toString());
  }

  @override
  Future<void> setThemeType(bool isSystemTheme) async {
    final Box themeBox = await Hive.openBox('theme');
    themeBox.put('isSystemTheme', isSystemTheme.toString());
  }
}
