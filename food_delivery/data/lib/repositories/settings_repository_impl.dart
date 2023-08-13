import 'package:data/data.dart';
import 'package:domain/domain.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveProvider _hiveProvider;

  SettingsRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<bool> checkThemeMode() async {
    return _hiveProvider.getThemeMode();
  }

  @override
  Future<bool> checkThemeType() async {
    return _hiveProvider.getThemeType();
  }

  @override
  Future<void> setThemeMode(bool isDark) async {
    return _hiveProvider.setThemeMode(isDark);
  }

  @override
  Future<void> setThemeType(bool isSystemTheme) async {
    return _hiveProvider.setThemeType(isSystemTheme);
  }

  @override
  Future<double> checkFontSize() async {
    return _hiveProvider.getFontSize();
  }

  @override
  Future<void> setFontSize(double textScale) async {
    return _hiveProvider.setFontSize(textScale);
  }
}
