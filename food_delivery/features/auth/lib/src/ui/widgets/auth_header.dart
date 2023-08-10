import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: mediaQueryData.size.height * 0.3,
          width: mediaQueryData.size.width,
          child: const RiveAnimation.asset(
            RiveAnimationPath.waveOnSingInScreen,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppPadding.padding20,
            left: AppPadding.padding40,
          ),
          child: Text(
            'homePage.foodDelivery'.tr(),
            style: themeData.textTheme.headlineLarge!.copyWith(
              fontSize: 36,
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.size30,
        ),
      ],
    );
  }
}
