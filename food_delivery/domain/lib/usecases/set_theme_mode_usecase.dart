import 'package:domain/domain.dart';

class SetThemeModeUseCase {
  final ThemeRepository _themeRepository;

  SetThemeModeUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  Future<void> execute(bool input) async {
    return _themeRepository.setThemeMode(input);
  }
}
