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
    const List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
          ),
          label: 'Cart'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
          ),
          label: 'Order History'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Settings'),
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
