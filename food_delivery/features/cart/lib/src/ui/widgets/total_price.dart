import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  final int totalPrice;
  final VoidCallback onPressed;

  const TotalPrice({
    required this.totalPrice,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Column(
      children: <Widget>[
        const Divider(
          thickness: AppSize.size2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.padding10,
            horizontal: AppPadding.padding25,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${'cartScreen.totalPrice'.tr()}:',
                    style: themeData.textTheme.titleMedium,
                  ),
                  Text(
                    '\$$totalPrice',
                    style: themeData.textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: mediaQueryData.size.width * 0.9,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              textStyle: themeData.textTheme.labelMedium,
            ),
            child: Text('cartScreen.makeAnOrder'.tr()),
          ),
        ),
        const SizedBox(
          height: AppSize.size20,
        ),
      ],
    );
  }
}
