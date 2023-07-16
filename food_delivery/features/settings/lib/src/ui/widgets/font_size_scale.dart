import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class FontSizeScale extends StatelessWidget {
  const FontSizeScale({super.key});

  @override
  Widget build(BuildContext context) {
    final FontSizeBloc fontSizeBloc = BlocProvider.of(context);
    final ThemeData themeData = Theme.of(context);

    return BlocBuilder<FontSizeBloc, FontSizeState>(
      builder: (_, FontSizeState state) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Slider(
                value: state.textScale,
                min: 0.7,
                max: 1.3,
                divisions: 2,
                onChanged: (double textScaleValue) {
                  fontSizeBloc.add(
                    ChangeFontSize(textScale: textScaleValue),
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
