import 'package:flutter/material.dart';
import 'package:settings/src/ui/widgets/font_size_scale.dart';

import 'widgets/theme_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ThemeSettings(),
          Divider(
            thickness: 2,
          ),
          FontSizeScale(),
        ],
      ),
    );
  }
}
