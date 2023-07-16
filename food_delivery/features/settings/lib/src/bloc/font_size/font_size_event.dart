part of 'font_size_bloc.dart';

abstract class FontSizeEvent {
  const FontSizeEvent();
}

class InitFontSize extends FontSizeEvent {
  InitFontSize();
}

class ChangeFontSize extends FontSizeEvent {
  final double textScale;

  ChangeFontSize({
    required this.textScale,
  });
}
