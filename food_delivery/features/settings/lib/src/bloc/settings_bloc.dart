import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final CheckThemeModeUseCase _checkThemeModeUseCase;
  final CheckThemeTypeUseCase _checkThemeTypeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;
  final SetThemeTypeUseCase _setThemeTypeUseCase;
  final CheckFontSizeUseCase _checkFontSizeUseCase;
  final SetFontSizeUseCase _setFontSizeUseCase;

  SettingsBloc({
    required CheckThemeModeUseCase checkThemeModeUseCase,
    required CheckThemeTypeUseCase checkThemeTypeUseCase,
    required SetThemeModeUseCase setThemeModeUseCase,
    required SetThemeTypeUseCase setThemeTypeUseCase,
    required CheckFontSizeUseCase checkFontSizeUseCase,
    required SetFontSizeUseCase setFontSizeUseCase,
  })  : _checkThemeModeUseCase = checkThemeModeUseCase,
        _checkThemeTypeUseCase = checkThemeTypeUseCase,
        _setThemeModeUseCase = setThemeModeUseCase,
        _setThemeTypeUseCase = setThemeTypeUseCase,
        _checkFontSizeUseCase = checkFontSizeUseCase,
        _setFontSizeUseCase = setFontSizeUseCase,
        super(
          SettingsState.empty(),
        ) {
    on<InitSettings>(_initSettings);
    on<ChangeThemeMode>(_changeThemeMode);
    on<ChangeThemeType>(_changeThemeType);
    on<ChangeFontSize>(_changeFontSize);

    add(InitSettings());
  }

  Future<void> _initSettings(
    InitSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final bool isSystemTheme = await _checkThemeTypeUseCase.execute(
      const NoParams(),
    );

    final double textScale = await _checkFontSizeUseCase.execute(
      const NoParams(),
    );

    emit(state.copyWith(textScale: textScale));

    if (isSystemTheme) {
      emit(
        state.copyWith(isSystemTheme: isSystemTheme),
      );
    } else {
      final bool isDark = await _checkThemeModeUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          themeData: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
        ),
      );
    }
  }

  Future<void> _changeThemeMode(
    ChangeThemeMode event,
    Emitter<SettingsState> emit,
  ) async {
    await _setThemeModeUseCase.execute(event.isDark);
    emit(
      state.copyWith(
        isDark: event.isDark,
        themeData: event.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      ),
    );
  }

  Future _changeThemeType(
    ChangeThemeType event,
    Emitter<SettingsState> emit,
  ) async {
    await _setThemeTypeUseCase.execute(event.isSystemTheme);
    emit(
      state.copyWith(isSystemTheme: event.isSystemTheme),
    );
  }

  Future<void> _changeFontSize(
    ChangeFontSize event,
    Emitter<SettingsState> emit,
  ) async {
    await _setFontSizeUseCase.execute(event.textScale);
    emit(state.copyWith(textScale: event.textScale));
  }
}
