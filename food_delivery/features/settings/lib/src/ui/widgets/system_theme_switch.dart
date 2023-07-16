import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SystemThemeSwitch extends StatelessWidget {
  const SystemThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = BlocProvider.of<ThemeBloc>(context);
    final ThemeData themeData = Theme.of(context);

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState state) {
        return Container(
          padding: const EdgeInsets.all(
            AppPadding.padding15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Use system theme',
                style: themeData.textTheme.titleMedium!.copyWith(
                  color: themeData.primaryColor,
                ),
              ),
              Switch(
                value: state.isSystemTheme,
                onChanged: (bool value) {
                  bloc.add(
                    ChangeThemeType(isSystemTheme: value),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
