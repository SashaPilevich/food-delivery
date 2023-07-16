part of 'font_size_preferences_provider.dart';

class FontSizePreferencesProviderImpl implements FontSizePreferencesProvider {
  FontSizePreferencesProviderImpl();

  @override
  Future<double> getFontSize() async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    return fontSizeBox.get('textScale');
  }

  @override
  Future<void> setFontSize(double textScale) async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    fontSizeBox.put('textScale', textScale);
  }
}
