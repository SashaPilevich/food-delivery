import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatefulWidget {
  const HomeScreenHeader({super.key});

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
  }

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
          RotationTransition(
            turns: _animation,
            child: ClipOval(
              child: Image.asset(
                'assets/image/onboarding_image.png',
                fit: BoxFit.cover,
                height: mediaQueryData.size.height * 0.13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
