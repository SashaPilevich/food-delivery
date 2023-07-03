import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension CustomBottomNavigationBarItemEx on CustomBottomNavigationBarItem {
  String get label {
    switch (this) {
      case CustomBottomNavigationBarItem.home:
        return 'homePage.home'.tr();
      case CustomBottomNavigationBarItem.cart:
        return 'homePage.cart'.tr();
      case CustomBottomNavigationBarItem.orderHistory:
        return 'homePage.orderHistory'.tr();
      case CustomBottomNavigationBarItem.settings:
        return 'homePage.settings'.tr();
      default:
        return '';
    }
  }

  Icon get icon {
    switch (this) {
      case CustomBottomNavigationBarItem.home:
        return const Icon(Icons.home);
      case CustomBottomNavigationBarItem.cart:
        return const Icon(Icons.shopping_bag_outlined);
      case CustomBottomNavigationBarItem.orderHistory:
        return const Icon(Icons.list);
      case CustomBottomNavigationBarItem.settings:
        return const Icon(Icons.settings);
      default:
        return const Icon(Icons.home);
    }
  }
}
