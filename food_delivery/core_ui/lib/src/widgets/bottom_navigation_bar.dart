import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
    final List<Widget> iconItems = CustomBottomNavigationBarItem.values
        .map((CustomBottomNavigationBarItem item) {
          return BottomNavigationBarItem(
            icon: item.icon,
          );
        })
        .toList()
        .map((BottomNavigationBarItem item) => item.icon)
        .toList();

    return CurvedNavigationBar(
      height: AppSize.size60,
      items: iconItems,
      index: currentIndex,
      onTap: onTap,
      backgroundColor: themeData.canvasColor,
    );
  }
}
