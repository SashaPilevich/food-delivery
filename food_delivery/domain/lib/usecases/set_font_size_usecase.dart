import 'package:domain/domain.dart';

class SetFontSizeUseCase implements FutureUseCase<double,void>{
  final SettingsRepository _settingsRepository;

  SetFontSizeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(double input) async {
    return _settingsRepository.setFontSize(input);
  }
}
