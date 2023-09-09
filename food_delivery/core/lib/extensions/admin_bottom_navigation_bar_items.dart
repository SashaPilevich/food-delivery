import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension AdminBottomNavigationBarItemsExtension on AdminBottomNavigationBarItems {
  Icon get icon {
    switch (this) {
      case AdminBottomNavigationBarItems.dashboard:
        return const Icon(Icons.dashboard);
      case AdminBottomNavigationBarItems.users:
        return const Icon(Icons.people);
      case AdminBottomNavigationBarItems.orders:
        return const Icon(Icons.shopping_cart);
      case AdminBottomNavigationBarItems.products:
        return const Icon(Icons.shopping_bag);
      default:
        return const Icon(Icons.dashboard);
    }
  }
}
