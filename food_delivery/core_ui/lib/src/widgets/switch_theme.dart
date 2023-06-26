import 'package:core/core.dart';
import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

class CustomSwitchTheme extends StatelessWidget {
  const CustomSwitchTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ThemeBloc>(context);
    return BlocBuilder<ThemeBloc, ThemeChangedState>(
      bloc: bloc,
      builder: (BuildContext context,ThemeChangedState state) {
        return Switch(
          activeColor: AppColors.black,
          activeTrackColor: AppColors.white,
          value: state.isDark,
          onChanged: (value) {
            bloc.add(
              ChangeThemeEvent(),
            );
          },
        );
      },
    );
  }
}
