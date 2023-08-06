import 'package:core/core.dart';

const String theme = 'theme';
const String fontSize = 'fontSize';

class SettingsPreferencesProvider {
  const SettingsPreferencesProvider();

  Future<bool> getThemeMode() async {
    final Box themeBox = await Hive.openBox(theme);
    return themeBox.get('isDark').toString() == 'true' ? true : false;
  }

  Future<bool> getThemeType() async {
    final Box themeBox = await Hive.openBox(theme);
    return themeBox.get('isSystemTheme').toString() == 'true' ? true : false;
  }

  Future<void> setThemeMode(bool isDark) async {
    final Box themeBox = await Hive.openBox(theme);
    themeBox.put('isDark', isDark.toString());
  }

  Future<void> setThemeType(bool isSystemTheme) async {
    final Box themeBox = await Hive.openBox(theme);
    themeBox.put('isSystemTheme', isSystemTheme.toString());
  }

  Future<double> getFontSize() async {
    final Box fontSizeBox = await Hive.openBox(fontSize);
    return fontSizeBox.get('textScale');
  }

  Future<void> setFontSize(double textScale) async {
    final Box fontSizeBox = await Hive.openBox(fontSize);
    fontSizeBox.put('textScale', textScale);
  }
}
