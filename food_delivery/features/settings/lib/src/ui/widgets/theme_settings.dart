import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'custom_theme_selector.dart';
import 'system_theme_switch.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppPadding.padding15,
      ),
      child: const Column(
        children: <Widget>[
          SystemThemeSwitch(),
          CustomThemeSelector(),
        ],
      ),
    );
  }
}
