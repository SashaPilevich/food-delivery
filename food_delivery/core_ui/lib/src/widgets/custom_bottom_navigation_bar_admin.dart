import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarAdmin extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBarAdmin({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> iconItems = AdminBottomNavigationBarItems.values
        .map((item) {
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
      backgroundColor: AppColors.transparent,
    );
  }
}
