// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    StartScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const StartScreen(),
      );
    },
    SignInScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    AdminPanelScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminPanelScreen(),
      );
    },
    AddProductScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddProductScreen(),
      );
    },
    SelectDishScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SelectDishScreenRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SelectDishScreen(
          dish: args.dish,
          key: args.key,
        ),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    CartScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    OrderHistoryScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    DashboardScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    UsersScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UsersScreen(),
      );
    },
    OrdersScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrdersScreen(),
      );
    },
    ProductsScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProductsScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          StartScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          SignInScreenRoute.name,
          path: '/sign-in-screen',
        ),
        RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
          children: [
            RouteConfig(
              HomeScreenRoute.name,
              path: 'home-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              CartScreenRoute.name,
              path: 'cart-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              OrderHistoryScreenRoute.name,
              path: 'order-history-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              SettingsScreenRoute.name,
              path: 'settings-screen',
              parent: HomePageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          AdminPanelScreenRoute.name,
          path: '/admin-panel-screen',
          children: [
            RouteConfig(
              DashboardScreenRoute.name,
              path: 'dashboard-screen',
              parent: AdminPanelScreenRoute.name,
            ),
            RouteConfig(
              UsersScreenRoute.name,
              path: 'users-screen',
              parent: AdminPanelScreenRoute.name,
            ),
            RouteConfig(
              OrdersScreenRoute.name,
              path: 'orders-screen',
              parent: AdminPanelScreenRoute.name,
            ),
            RouteConfig(
              ProductsScreenRoute.name,
              path: 'products-screen',
              parent: AdminPanelScreenRoute.name,
            ),
          ],
        ),
        RouteConfig(
          AddProductScreenRoute.name,
          path: '/add-product-screen',
        ),
        RouteConfig(
          SelectDishScreenRoute.name,
          path: '/select-dish-screen',
        ),
      ];
}

/// generated route for
/// [StartScreen]
class StartScreenRoute extends PageRouteInfo<void> {
  const StartScreenRoute()
      : super(
          StartScreenRoute.name,
          path: '/',
        );

  static const String name = 'StartScreenRoute';
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(
          SignInScreenRoute.name,
          path: '/sign-in-screen',
        );

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/home-page',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [AdminPanelScreen]
class AdminPanelScreenRoute extends PageRouteInfo<void> {
  const AdminPanelScreenRoute({List<PageRouteInfo>? children})
      : super(
          AdminPanelScreenRoute.name,
          path: '/admin-panel-screen',
          initialChildren: children,
        );

  static const String name = 'AdminPanelScreenRoute';
}

/// generated route for
/// [AddProductScreen]
class AddProductScreenRoute extends PageRouteInfo<void> {
  const AddProductScreenRoute()
      : super(
          AddProductScreenRoute.name,
          path: '/add-product-screen',
        );

  static const String name = 'AddProductScreenRoute';
}

/// generated route for
/// [SelectDishScreen]
class SelectDishScreenRoute extends PageRouteInfo<SelectDishScreenRouteArgs> {
  SelectDishScreenRoute({
    required DishModel dish,
    Key? key,
  }) : super(
          SelectDishScreenRoute.name,
          path: '/select-dish-screen',
          args: SelectDishScreenRouteArgs(
            dish: dish,
            key: key,
          ),
        );

  static const String name = 'SelectDishScreenRoute';
}

class SelectDishScreenRouteArgs {
  const SelectDishScreenRouteArgs({
    required this.dish,
    this.key,
  });

  final DishModel dish;

  final Key? key;

  @override
  String toString() {
    return 'SelectDishScreenRouteArgs{dish: $dish, key: $key}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: 'home-screen',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [CartScreen]
class CartScreenRoute extends PageRouteInfo<void> {
  const CartScreenRoute()
      : super(
          CartScreenRoute.name,
          path: 'cart-screen',
        );

  static const String name = 'CartScreenRoute';
}

/// generated route for
/// [OrderHistoryScreen]
class OrderHistoryScreenRoute extends PageRouteInfo<void> {
  const OrderHistoryScreenRoute()
      : super(
          OrderHistoryScreenRoute.name,
          path: 'order-history-screen',
        );

  static const String name = 'OrderHistoryScreenRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsScreenRoute extends PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: 'settings-screen',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [DashboardScreen]
class DashboardScreenRoute extends PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(
          DashboardScreenRoute.name,
          path: 'dashboard-screen',
        );

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [UsersScreen]
class UsersScreenRoute extends PageRouteInfo<void> {
  const UsersScreenRoute()
      : super(
          UsersScreenRoute.name,
          path: 'users-screen',
        );

  static const String name = 'UsersScreenRoute';
}

/// generated route for
/// [OrdersScreen]
class OrdersScreenRoute extends PageRouteInfo<void> {
  const OrdersScreenRoute()
      : super(
          OrdersScreenRoute.name,
          path: 'orders-screen',
        );

  static const String name = 'OrdersScreenRoute';
}

/// generated route for
/// [ProductsScreen]
class ProductsScreenRoute extends PageRouteInfo<void> {
  const ProductsScreenRoute()
      : super(
          ProductsScreenRoute.name,
          path: 'products-screen',
        );

  static const String name = 'ProductsScreenRoute';
}
