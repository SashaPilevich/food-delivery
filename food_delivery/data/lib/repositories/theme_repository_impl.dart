import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemePreferencesProvider _themePreferencesProvider;

  ThemeRepositoryImpl({
    required ThemePreferencesProvider themePreferencesProvider,
  }) : _themePreferencesProvider = themePreferencesProvider;

  @override
  Future<bool> checkThemeMode() async {
    return _themePreferencesProvider.getThemeMode();
  }

  @override
  Future<bool> checkThemeType() async {
    return _themePreferencesProvider.getThemeType();
  }

  @override
  Future<void> setThemeMode(bool isDark) async {
    return _themePreferencesProvider.setThemeMode(isDark);
  }

  @override
  Future<void> setThemeType(bool isSystemTheme) async {
    return _themePreferencesProvider.setThemeType(isSystemTheme);
  }
}
