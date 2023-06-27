import 'package:auto_route/auto_route.dart';
import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(
        page: HomeScreen,
        initial: true,
      ),
      AutoRoute(
        page: CartScreen,
      ),
      AutoRoute(
        page: OrderHistoryScreen,
      ),
      AutoRoute(
        page: SettingsScreen,
      ),
    ]),
  ],
)
class AppRouter extends _$AppRouter {}
