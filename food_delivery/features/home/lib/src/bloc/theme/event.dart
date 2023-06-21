part of 'bloc.dart';

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final bool isDark;

  ChangeThemeEvent(this.isDark);
}
