part of 'bloc.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeChangedState extends ThemeState {
  final bool isDark;

  ThemeChangedState({required this.isDark});
}
