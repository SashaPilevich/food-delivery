import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  final CheckFontSizeUseCase _checkFontSizeUseCase;
  final SetFontSizeUseCase _setFontSizeUseCase;
  FontSizeBloc({
    required CheckFontSizeUseCase checkFontSizeUseCase,
    required SetFontSizeUseCase setFontSizeUseCase,
  })  : _checkFontSizeUseCase = checkFontSizeUseCase,
        _setFontSizeUseCase = setFontSizeUseCase,
        super(FontSizeState(textScale: 1.0)) {
    on<InitFontSize>(_initFontSize);
    on<ChangeFontSize>(_changeFontSize);

    add(InitFontSize());
  }

  Future<void> _initFontSize(
    InitFontSize event,
    Emitter<FontSizeState> emit,
  ) async {
    final double textScale =
        await _checkFontSizeUseCase.execute(const NoParams());
    emit(state.copyWith(textScale: textScale));
  }

  Future<void> _changeFontSize(
    ChangeFontSize event,
    Emitter<FontSizeState> emit,
  ) async {
    emit(state.copyWith(textScale: event.textScale));
    await _setFontSizeUseCase.execute(event.textScale);
  }
}
