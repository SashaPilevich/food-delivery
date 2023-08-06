import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/ui/widgets/font_size_slider.dart';
import 'package:settings/src/ui/widgets/select_language.dart';
import 'widgets/theme_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'homePage.settings'.tr(),
      ),
      body: ListView(
        children: const <Widget>[
          ThemeSettings(),
          Divider(
            thickness: AppSize.size2,
          ),
          FontSizeSlider(),
          Divider(
            thickness: AppSize.size2,
          ),
          SelectLanguage(),
        ],
      ),
    );
  }
}
