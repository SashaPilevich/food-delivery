import 'package:domain/domain.dart';

class SetThemeModeUseCase implements FutureUseCase<bool,void>{
  final SettingsRepository _settingsRepository;

  SetThemeModeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(bool input) async {
    return _settingsRepository.setThemeMode(input);
  }
}
