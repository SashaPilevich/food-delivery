import 'package:core/core.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ChangeThemeEvent, ThemeChangedState> {
  ThemeBloc() : super(ThemeChangedState(isDark: false)) {
    on<ChangeThemeEvent>(_toggleTheme);
  }

  Future<void> _toggleTheme(
    ChangeThemeEvent event,
    Emitter<ThemeChangedState> emit,
  ) async {
    emit(
      state.copyWith(isDark: !state.isDark),
    );
  }
}
