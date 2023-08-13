import 'package:domain/domain.dart';

class SetThemeTypeUseCase implements FutureUseCase<bool,void>{
  final SettingsRepository _settingsRepository;

  SetThemeTypeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(bool input) async {
    return _settingsRepository.setThemeType(input);
  }
}
