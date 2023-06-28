import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomNavigationBarTheme =
        Theme.of(context).bottomNavigationBarTheme;
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.home,
        ),
        label: 'home'.tr(),
      ),
      BottomNavigationBarItem(
          icon: const Icon(
            Icons.shopping_bag_outlined,
          ),
          label: 'cart'.tr()),
      BottomNavigationBarItem(
          icon: const Icon(
            Icons.list,
          ),
          label: 'orderHistory'.tr()),
      BottomNavigationBarItem(
          icon: const Icon(
            Icons.settings,
          ),
          label: 'settings'.tr()),
    ];
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: bottomNavigationBarTheme.backgroundColor,
      selectedItemColor: bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor: bottomNavigationBarTheme.unselectedItemColor,
    );
  }
}
