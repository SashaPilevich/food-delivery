import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  final VoidCallback onPressed;

  const EmptyCart({
    required this.onPressed,
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
            'cartScreen.yourShoppingCartIsEmpty'.tr(),
            style: themeData.textTheme.titleLarge,
          ),
          const SizedBox(
            height: AppSize.size_30,
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
