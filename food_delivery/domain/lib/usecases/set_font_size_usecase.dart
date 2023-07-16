import 'package:domain/repositories/font_size_repository.dart';

class SetFontSizeUseCase {
  final FontSizeRepository _fontSizeRepository;

  SetFontSizeUseCase({
    required FontSizeRepository fontSizeRepository,
  }) : _fontSizeRepository = fontSizeRepository;

  Future<void> execute(double input) async {
    return _fontSizeRepository.setFontSize(input);
  }
}
