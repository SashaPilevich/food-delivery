import 'base_path.dart';
import 'font_size_for_animation.dart';

class RiveAnimationPath {
  static const String waveOnSingInScreen = '${basePathRive}wave.riv';
  static String fromFontSize(double fontSize) {
    switch (fontSize) {
      case FontSize.fontSize12:
        return '${basePathRive}font_size_12.riv';
      case FontSize.fontSize14:
        return '${basePathRive}font_size_14.riv';
      case FontSize.fontSize16:
        return '${basePathRive}font_size_16.riv';
      case FontSize.fontSize18:
        return '${basePathRive}font_size_18.riv';
      case FontSize.fontSize20:
        return '${basePathRive}font_size_20.riv';
      default:
        return '${basePathRive}font_size_16.riv';
    }
  }
}
