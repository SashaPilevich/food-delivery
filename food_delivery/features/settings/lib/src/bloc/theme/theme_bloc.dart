import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final CheckThemeModeUseCase _checkThemeModeUseCase;
  final CheckThemeTypeUseCase _checkThemeTypeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;
  final SetThemeTypeUseCase _setThemeTypeUseCase;

  ThemeBloc({
    required CheckThemeModeUseCase checkThemeModeUseCase,
    required CheckThemeTypeUseCase checkThemeTypeUseCase,
    required SetThemeModeUseCase setThemeModeUseCase,
    required SetThemeTypeUseCase setThemeTypeUseCase,
  })  : _checkThemeModeUseCase = checkThemeModeUseCase,
        _checkThemeTypeUseCase = checkThemeTypeUseCase,
        _setThemeModeUseCase = setThemeModeUseCase,
        _setThemeTypeUseCase = setThemeTypeUseCase,
        super(ThemeState.empty(
          AppTheme.lightTheme,
          false,
          false,
        )) {
    on<InitTheme>(_initTheme);
    on<ChangeThemeMode>(_changeThemeMode);
    on<ChangeThemeType>(_changeThemeType);

    add(InitTheme());
  }

  Future<void> _initTheme(
    InitTheme event,
    Emitter<ThemeState> emit,
  ) async {
    final bool isSystemTheme = await _checkThemeTypeUseCase.execute(
      const NoParams(),
    );
    final bool isDark = await _checkThemeModeUseCase.execute(
      const NoParams(),
    );

    if (isSystemTheme) {
      emit(
        state.copyWith(isSystemTheme: isSystemTheme),
      );
    } else {
      if (isDark) {
        emit(
          state.copyWith(themeData: AppTheme.darkTheme),
        );
      } else {
        emit(
          state.copyWith(themeData: AppTheme.lightTheme),
        );
      }
    }
  }

  Future<void> _changeThemeMode(
    ChangeThemeMode event,
    Emitter<ThemeState> emit,
  ) async {
    emit(
      state.copyWith(isDark: event.isDark),
    );
    if (event.isDark) {
      emit(
        state.copyWith(themeData: AppTheme.darkTheme),
      );
    } else {
      emit(
        state.copyWith(themeData: AppTheme.lightTheme),
      );
    }
    await _setThemeModeUseCase.execute(event.isDark);
  }

  Future _changeThemeType(
    ChangeThemeType event,
    Emitter<ThemeState> emit,
  ) async {
    emit(
      state.copyWith(isSystemTheme: event.isSystemTheme),
    );
    await _setThemeTypeUseCase.execute(event.isSystemTheme);
  }
}
