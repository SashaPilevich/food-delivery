import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(
        AppMargin.margin20,
      ),
      width: mediaQueryData.size.width * 0.9,
      height: mediaQueryData.size.height * 0.15,
      decoration: BoxDecoration(
        color: themeData.primaryColor,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.borderRadius15,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'homePage.foodDelivery'.tr(),
                style: themeData.textTheme.titleMedium!.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: AppSize.size20,
              ),
              Text(
                'homeScreen.chooseDishes'.tr(),
                style: themeData.textTheme.titleSmall!.copyWith(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0.0,
              end: math.pi * 4,
            ),
            duration: const Duration(
              seconds: 2,
            ),
            curve: Curves.linear,
            builder: (_, double value, Widget? child) {
              return Transform.rotate(
                angle: value,
                child: child,
              );
            },
            child: ClipOval(
              child: Image.asset(
                ImagePath.onboardingImage,
                fit: BoxFit.cover,
                height: mediaQueryData.size.height * 0.13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
