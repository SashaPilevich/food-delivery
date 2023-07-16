abstract class FontSizeRepository {
  Future<double> checkFontSize();
  Future<void> setFontSize(double textScale);
}
