import 'package:core/core.dart';

part 'event.dart';
part 'state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool _isDark = false;

  ThemeBloc() : super(ThemeInitialState()) {
    on<ChangeThemeEvent>(_toggleTheme);
  }

  void _toggleTheme(ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    _isDark = event.isDark;
    emit(
      ThemeChangedState(isDark: _isDark),
    );
  }
}
