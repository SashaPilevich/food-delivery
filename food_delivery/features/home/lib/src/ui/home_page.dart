import 'package:core_ui/core_ui.dart';
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
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: const Text('Food Delivery'),
        actions: const <Widget>[
          CustomSwitchTheme(),
        ],
      ),
      bottomNavigationBuilder: (context, tabsRouter) =>
          CustomBottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
      ),
    );
  }
}
