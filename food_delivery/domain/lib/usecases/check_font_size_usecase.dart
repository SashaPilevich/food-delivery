import 'package:domain/domain.dart';

class CheckFontSizeUseCase implements FutureUseCase<NoParams, double> {
  final FontSizeRepository _fontSizeRepository;

  CheckFontSizeUseCase({
    required FontSizeRepository fontSizeRepository,
  }) : _fontSizeRepository = fontSizeRepository;

  @override
  Future<double> execute(NoParams input) async {
    return _fontSizeRepository.checkFontSize();
  }
}
