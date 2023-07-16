import 'package:domain/domain.dart';

class CheckThemeModeUseCase implements FutureUseCase<NoParams, bool> {
  final ThemeRepository _themeRepository;

  CheckThemeModeUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  @override
  Future<bool> execute(NoParams input) async {
    return _themeRepository.checkThemeMode();
  }
}
