import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'button_dish_card.dart';
import 'image_dish_card.dart';

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
    final TextTheme textThemeData = themeData.textTheme;
    return InkWell(
      splashColor: themeData.primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      onTap: onTap,
      child: Card(
        shadowColor: AppColors.lightPink,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 6,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: <Widget>[
              ImageDishCard(imageUrl: dish.imageUrl),
              const SizedBox(height: 10),
              Text(
                dish.title,
                style: textThemeData.titleLarge,
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '\$${dish.cost}',
                      style: textThemeData.titleMedium,
                    ),
                  ),
                  Expanded(
                    child: ButtonDishCard(
                      label: '+${'add'.tr()}',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
