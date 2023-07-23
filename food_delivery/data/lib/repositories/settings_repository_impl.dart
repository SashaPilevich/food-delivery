import 'package:data/data.dart';
import 'package:domain/domain.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsPreferencesProvider _settingsPreferencesProvider;

  SettingsRepositoryImpl({
    required SettingsPreferencesProvider settingsPreferencesProvider,
  }) : _settingsPreferencesProvider = settingsPreferencesProvider;

  @override
  Future<bool> checkThemeMode() async {
    return _settingsPreferencesProvider.getThemeMode();
  }

  @override
  Future<bool> checkThemeType() async {
    return _settingsPreferencesProvider.getThemeType();
  }

  @override
  Future<void> setThemeMode(bool isDark) async {
    return _settingsPreferencesProvider.setThemeMode(isDark);
  }

  @override
  Future<void> setThemeType(bool isSystemTheme) async {
    return _settingsPreferencesProvider.setThemeType(isSystemTheme);
  }

  @override
  Future<double> checkFontSize() async {
    return _settingsPreferencesProvider.getFontSize();
  }

  @override
  Future<void> setFontSize(double textScale) async {
    return _settingsPreferencesProvider.setFontSize(textScale);
  }
}
