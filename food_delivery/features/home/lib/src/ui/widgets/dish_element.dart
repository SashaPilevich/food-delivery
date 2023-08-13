import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/widgets/animated_add_to_cart_button.dart';
import 'package:settings/settings.dart';

class DishElement extends StatelessWidget {
  final DishModel dish;
  final VoidCallback onTap;

  const DishElement({
    required this.dish,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final SettingsBloc settingsBloc = BlocProvider.of(context);

    return InkWell(
      splashColor: themeData.primaryColor,
      child: Container(
        padding: const EdgeInsets.only(
          top: AppPadding.padding8,
          left: AppPadding.padding15,
          right: AppPadding.padding15,
        ),
        decoration: BoxDecoration(
          color: settingsBloc.state.isSystemTheme
              ? themeData.cardColor
              : themeData.cardTheme.color,
        ),
        child: Column(
          children: <Widget>[
            AppCacheImage(
              imageUrl: dish.imageUrl,
              height: mediaQueryData.size.height * 0.13,
            ),
            const SizedBox(
              height: AppSize.size10,
            ),
            FittedBox(
              child: Text(
                dish.title,
                style: themeData.textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: AppSize.size10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '\$${dish.cost}',
                    style: themeData.textTheme.titleMedium,
                  ),
                ),
                AnimatedAddToCartButton(dish: dish),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
