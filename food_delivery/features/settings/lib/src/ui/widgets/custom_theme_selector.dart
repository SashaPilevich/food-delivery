import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class CustomThemeSelector extends StatelessWidget {
  const CustomThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ThemeBloc bloc = BlocProvider.of<ThemeBloc>(context);

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (
        _,
        ThemeState state,
      ) {
        if (state.isSystemTheme) {
          return Container();
        } else {
          return Container(
            padding: const EdgeInsets.all(
              AppPadding.padding15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Use custom theme: ',
                  style: themeData.textTheme.titleMedium!.copyWith(
                    color: themeData.primaryColor,
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
                        selectedIcon: const Icon(
                          Icons.light_mode_sharp,
                          color: AppColors.grey,
                        ),
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
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.orange),
                        ),
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
