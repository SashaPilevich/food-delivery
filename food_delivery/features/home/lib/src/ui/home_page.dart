import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DishesBloc>(
          create: (_) => DishesBloc(
            fetchAllDishesUseCase: getIt.get<FetchAllDishesUseCase>(),
          ),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(),
        ),
      ],
      child: AutoTabsScaffold(
        routes: const <PageRouteInfo<dynamic>>[
          HomeScreenRoute(),
          CartScreenRoute(),
          OrderHistoryScreenRoute(),
          SettingsScreenRoute(),
        ],
        appBarBuilder: (_, TabsRouter tabsRouter) {
          return AppBar(
            title: Text(
              'homePage.foodDelivery'.tr(),
            ),
            actions: <Widget>[
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
      ),
    );
  }
}
