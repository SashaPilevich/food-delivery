import 'package:domain/domain.dart';

class CheckThemeTypeUseCase implements FutureUseCase<NoParams, bool> {
  final ThemeRepository _themeRepository;

  CheckThemeTypeUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  @override
  Future<bool> execute(NoParams input) async {
    return _themeRepository.checkThemeType();
  }
}
