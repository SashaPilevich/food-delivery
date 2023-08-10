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
                  style: themeData.textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  FontSizeAnimatedBox(
                    child: state.textScale.isExactly(
                              FontSize.fontSize12,
                            ) ||
                            state.textScale.isBetween(
                              FontSize.fontSize12,
                              FontSize.fontSize14,
                            )
                        ? const FontSizeAnimation(
                            riveAnimationPath: RiveAnimationPath.fontSize12,
                          )
                        : const SizedBox.shrink(),
                  ),
                  FontSizeAnimatedBox(
                    child: state.textScale.isBetween(
                      FontSize.fontSize14,
                      FontSize.fontSize16,
                    )
                        ? const FontSizeAnimation(
                            riveAnimationPath: RiveAnimationPath.fontSize14,
                          )
                        : const SizedBox.shrink(),
                  ),
                  FontSizeAnimatedBox(
                    child: state.textScale.isBetween(
                      FontSize.fontSize16,
                      FontSize.fontSize18,
                    )
                        ? const FontSizeAnimation(
                            riveAnimationPath: RiveAnimationPath.fontSize16,
                          )
                        : const SizedBox.shrink(),
                  ),
                  FontSizeAnimatedBox(
                    child: state.textScale.isBetween(
                      FontSize.fontSize18,
                      FontSize.fontSize20,
                    )
                        ? const FontSizeAnimation(
                            riveAnimationPath: RiveAnimationPath.fontSize18,
                          )
                        : const SizedBox.shrink(),
                  ),
                  FontSizeAnimatedBox(
                    child: state.textScale.isExactly(
                      FontSize.fontSize20,
                    )
                        ? const FontSizeAnimation(
                            riveAnimationPath: RiveAnimationPath.fontSize20,
                          )
                        : const SizedBox.shrink(),
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
