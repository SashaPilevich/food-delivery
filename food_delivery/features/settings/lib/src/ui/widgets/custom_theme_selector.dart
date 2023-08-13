import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class CustomThemeSelector extends StatelessWidget {
  const CustomThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (
        _,
        SettingsState state,
      ) {
        if (state.isSystemTheme) {
          return const SizedBox.shrink();
        } else {
          return Container(
            padding: const EdgeInsets.all(
              AppPadding.padding15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: mediaQuery.size.width * 0.5,
                  child: Text(
                    'settingsScreen.useCustomTheme'.tr(),
                    style: themeData.textTheme.titleMedium!.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          bloc.add(
                            ChangeThemeMode(isDark: false),
                          );
                        },
                        icon: const Icon(
                          Icons.light_mode_sharp,
                          color: AppColors.pink,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          bloc.add(
                            ChangeThemeMode(isDark: true),
                          );
                        },
                        icon: const Icon(
                          Icons.dark_mode_sharp,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
