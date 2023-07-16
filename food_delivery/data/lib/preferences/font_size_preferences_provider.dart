import 'package:core/core.dart';

part 'font_size_preferences_provider_impl.dart';

abstract class FontSizePreferencesProvider {
  Future<double> getFontSize();
  Future<void> setFontSize(double textScale);
}
