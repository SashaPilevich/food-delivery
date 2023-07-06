import 'package:core/core.dart';
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
    final ThemeData themeData = Theme.of(context);
    final List<BottomNavigationBarItem> items = CustomBottomNavigationBarItem
        .values
        .map((CustomBottomNavigationBarItem item) {
      return BottomNavigationBarItem(
        icon: item.icon,
        label: item.label,
      );
    }).toList();

    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: themeData.bottomNavigationBarTheme.backgroundColor,
      selectedItemColor: themeData.bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor:
          themeData.bottomNavigationBarTheme.unselectedItemColor,
    );
  }
}
