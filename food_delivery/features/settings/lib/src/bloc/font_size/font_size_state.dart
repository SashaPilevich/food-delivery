part of 'font_size_bloc.dart';

class FontSizeState {
  final double textScale;

  FontSizeState({
    required this.textScale,
  });

  FontSizeState copyWith({
    double? textScale,
  }) {
    return FontSizeState(
      textScale: textScale ?? this.textScale,
    );
  }
}
