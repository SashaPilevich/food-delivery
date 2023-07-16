import 'package:core/core.dart';

part 'theme_preferences_provider_impl.dart';

abstract class ThemePreferencesProvider {
  Future<bool> getThemeMode();
  Future<bool> getThemeType();
  Future<void> setThemeMode(bool isDark);
  Future<void> setThemeType(bool isSystemTheme);
}
