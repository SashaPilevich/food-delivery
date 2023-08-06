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
      children: [
        AutoRoute(page: HomeScreen, path: ''),
        AutoRoute(page: CartScreen),
        AutoRoute(page: OrderHistoryScreen),
        AutoRoute(page: SettingsScreen),
      ],
    ),
    AutoRoute(page: SelectDishScreen),
  ],
)
class AppRouter extends _$AppRouter {}
