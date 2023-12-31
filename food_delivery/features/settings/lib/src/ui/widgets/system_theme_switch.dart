import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SystemThemeSwitch extends StatelessWidget {
  const SystemThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Container(
          padding: const EdgeInsets.all(
            AppPadding.padding15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: mediaQuery.size.width * 0.7,
                child: Text(
                  'settingsScreen.useSystemTheme'.tr(),
                  style: themeData.textTheme.titleMedium!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
              Switch(
                activeColor: themeData.primaryColorLight,
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
