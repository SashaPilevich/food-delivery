import 'package:core/core.dart';
import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

class CustomSwitchTheme extends StatefulWidget {
  const CustomSwitchTheme({super.key});

  @override
  State<CustomSwitchTheme> createState() => _CustomSwitchThemeState();
}

class _CustomSwitchThemeState extends State<CustomSwitchTheme> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: AppColors.black,
      activeTrackColor: AppColors.white,
      value: isDark,
      onChanged: (value) {
        isDark = !isDark;
        ThemeBloc bloc = BlocProvider.of<ThemeBloc>(context);
        bloc.add(ChangeThemeEvent(isDark));
        setState(() {});
      },
    );
  }
}
