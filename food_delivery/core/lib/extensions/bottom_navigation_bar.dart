import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension CustomBottomNavigationBarItemEx on CustomBottomNavigationBarItem {
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
