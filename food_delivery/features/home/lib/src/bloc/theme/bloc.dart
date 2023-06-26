import 'package:core/core.dart';

part 'event.dart';
part 'state.dart';

class ThemeBloc extends Bloc<ChangeThemeEvent, ThemeChangedState> {
  bool _isDark = false;

  ThemeBloc() : super(ThemeChangedState(isDark: false)) {
    on<ChangeThemeEvent>(_toggleTheme);
  }

  void _toggleTheme(
      ChangeThemeEvent event, Emitter<ThemeChangedState> emit) async {
    _isDark = !_isDark;
    emit(
      state.copyWith(isDark: _isDark),
    );
  }
}
