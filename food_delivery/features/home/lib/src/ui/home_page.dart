import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/order_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<DishesBloc>(
          create: (_) => DishesBloc(
            fetchAllDishesUseCase: getIt.get<FetchAllDishesUseCase>(),
          ),
        ),
        BlocProvider<OrderBloc>(
          create: (_) => OrderBloc(
            addOrderUseCase: getIt.get<AddOrderUseCase>(),
            fetchOrdersUseCase: getIt.get<FetchOrdersUseCase>(),
            getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
          )..add(InitListOfOrders()),
        ),
      ],
      child: AutoTabsScaffold(
        animationDuration: const Duration(seconds: 1),
        routes: const <PageRouteInfo<dynamic>>[
          HomeScreenRoute(),
          CartScreenRoute(),
          OrderHistoryScreenRoute(),
          SettingsScreenRoute(),
        ],
        builder: (_, Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation.drive(
              Tween<double>(
                begin: 0.3,
                end: 1,
              ).chain(
                CurveTween(curve: Curves.linear),
              ),
            ),
            child: child,
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
