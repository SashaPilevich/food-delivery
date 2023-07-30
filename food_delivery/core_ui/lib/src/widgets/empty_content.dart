import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const EmptyContent({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: themeData.textTheme.titleLarge,
          ),
          const SizedBox(
            height: AppSize.size30,
          ),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              textStyle: themeData.textTheme.labelMedium,
            ),
            child: Text('cartScreen.chooseDishes'.tr()),
          ),
        ],
      ),
    );
  }
}
