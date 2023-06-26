part of 'bloc.dart';

class ThemeChangedState {
  final bool isDark;

  ThemeChangedState({required this.isDark});

  ThemeChangedState copyWith({
    bool? isDark,
  }) {
    return ThemeChangedState(
      isDark: isDark ?? this.isDark,
    );
  }
}
