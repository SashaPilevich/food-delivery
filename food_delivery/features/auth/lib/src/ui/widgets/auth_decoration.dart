import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthDecoration extends StatelessWidget {
  final String imageUrl;

  const AuthDecoration({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);

    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height * 0.4,
      decoration: BoxDecoration(
        color: themeData.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageUrl),
          const SizedBox(
            height: AppSize.size10,
          ),
          Text(
            'homePage.foodDelivery'.tr(),
            style: themeData.textTheme.headlineLarge!.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
