import 'package:core_ui/core_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeScreenRoute(),
        CartScreenRoute(),
        OrderHistoryScreenRoute(),
        SettingsScreenRoute(),
      ],
      appBarBuilder: (_, TabsRouter tabsRouter) {
        return AppBar(
          title: Text(
            'foodDelivery'.tr(),
          ),
          actions: <Widget>[
            const CustomSwitchTheme(),
            IconButton(
              onPressed: () {
                if (context.locale == const Locale('en', 'US')) {
                  context.setLocale(const Locale('pl', 'PL'));
                } else {
                  context.setLocale(const Locale('en', 'US'));
                }
              },
              icon: const Icon(
                Icons.language,
              ),
            ),
          ],
        );
      },
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return CustomBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
