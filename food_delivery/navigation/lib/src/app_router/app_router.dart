import 'package:admin_panel/admin_panel.dart';
import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cart/cart.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: StartScreen, initial: true),
    AutoRoute(page: SignInScreen),
    AutoRoute(
      page: HomePage,
      children: <AutoRoute>[
        AutoRoute(page: HomeScreen),
        AutoRoute(page: CartScreen),
        AutoRoute(page: OrderHistoryScreen),
        AutoRoute(page: SettingsScreen),
      ],
    ),
    AutoRoute(page: AdminPanelScreen, children: <AutoRoute>[
      AutoRoute(page: DashboardScreen),
      AutoRoute(page: UsersScreen),
      AutoRoute(page: OrdersScreen),
      AutoRoute(page: ProductsScreen),
    ]),
    AutoRoute(page: AddProductScreen),
    AutoRoute(page: SelectDishScreen),
  ],
)
class AppRouter extends _$AppRouter {}
