import 'package:domain/domain.dart';

class SetThemeTypeUseCase {
  final ThemeRepository _themeRepository;

  SetThemeTypeUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  Future<void> execute(bool input) async {
    return _themeRepository.setThemeType(input);
  }
}
