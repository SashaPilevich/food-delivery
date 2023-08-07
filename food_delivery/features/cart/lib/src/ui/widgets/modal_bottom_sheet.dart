import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'animated_check_mark.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(
            bottom: AppPadding.padding40,
          ),
          child: CheckMarkAnimation(),
        ),
        Text(
          'cartScreen.acceptedOrder'.tr(),
          style: themeData.textTheme.titleMedium!.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        const SizedBox(
          height: AppSize.size30,
        ),
        Text(
          'cartScreen.thankYou'.tr(),
          style: themeData.textTheme.titleMedium,
        ),
        const SizedBox(
          height: AppSize.size30,
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: FilledButton.styleFrom(
            textStyle: themeData.textTheme.labelMedium,
          ),
          child: Text(
            'cartScreen.takeMoreFood'.tr(),
          ),
        ),
      ],
    );
  }
}
