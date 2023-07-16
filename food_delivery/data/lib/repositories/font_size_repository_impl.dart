import 'package:data/data.dart';
import 'package:domain/repositories/font_size_repository.dart';

class FontSizeRepositoryImpl implements FontSizeRepository {
  final FontSizePreferencesProvider _fontSizePreferencesProvider;

  FontSizeRepositoryImpl({
    required FontSizePreferencesProvider fontSizePreferencesProvider,
  }) : _fontSizePreferencesProvider = fontSizePreferencesProvider;

  @override
  Future<double> checkFontSize() async {
    return _fontSizePreferencesProvider.getFontSize();
  }

  @override
  Future<void> setFontSize(double textScale) async {
    return _fontSizePreferencesProvider.setFontSize(textScale);
  }
}
