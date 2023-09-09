import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class DishInformation extends StatelessWidget {
  final String dishTitle;
  final String dishCost;

  const DishInformation({
    required this.dishTitle,
    required this.dishCost,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dishTitle,
            style: themeData.textTheme.headlineMedium,
          ),
          const SizedBox(
            height: AppSize.size10,
          ),
          Text(
            dishCost,
            style: themeData.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
