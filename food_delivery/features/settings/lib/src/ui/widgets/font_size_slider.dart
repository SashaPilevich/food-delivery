import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';
import 'font_size_animated_box.dart';
import 'font_size_animation.dart';

class FontSizeSlider extends StatelessWidget {
  const FontSizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    final ThemeData themeData = Theme.of(context);
    final List<double> fontSizeList = [
      FontSize.fontSize12,
      FontSize.fontSize14,
      FontSize.fontSize16,
      FontSize.fontSize18,
      FontSize.fontSize20,
    ];

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(
                  AppPadding.padding30,
                ),
                child: Text(
                  'settingsScreen.changeFontSize'.tr(),
                  style: themeData.textTheme.titleMedium,
                ),
              ),
              Row(
                children: <Widget>[
                  ...List.generate(
                    fontSizeList.length,
                    (int index) {
                      final double currentFontSize = fontSizeList[index];
                      final double nextFontSize =
                          index + 1 < fontSizeList.length
                              ? fontSizeList[index + 1]
                              : 1;

                      return FontSizeAnimatedBox(
                        child: state.textScale
                                    .isBetween(currentFontSize, nextFontSize) ||
                                state.textScale.isExactly(currentFontSize)
                            ? FontSizeAnimation(
                                riveAnimationPath:
                                    RiveAnimationPath.fromFontSize(
                                        currentFontSize),
                              )
                            : const SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
              Slider(
                value: state.textScale,
                min: 0.7,
                max: 1.3,
                onChanged: (double textScaleValue) {
                  bloc.add(
                    ChangeFontSize(
                      textScale: textScaleValue,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: AppSize.size30,
              ),
            ],
          ),
        );
      },
    );
  }
}
