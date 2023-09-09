import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo<dynamic>>[
        DashboardScreenRoute(),
        UsersScreenRoute(),
        OrdersScreenRoute(),
        ProductsScreenRoute()
      ],
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return CustomBottomNavigationBarAdmin(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
