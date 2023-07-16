import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'button_dish_card.dart';

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
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return InkWell(
      splashColor: themeData.primaryColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(AppBorderRadius.borderRadius15),
      ),
      onTap: onTap,
      child: Card(
        shadowColor: AppColors.lightPink,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppBorderRadius.borderRadius15),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: AppPadding.padding8,
            left: AppPadding.padding15,
            right: AppPadding.padding15,
          ),
          child: Column(
            children: <Widget>[
              Hero(
                tag: dish.imageUrl,
                child: AppCacheImage(
                  src: dish.imageUrl,
                  height: mediaQueryData.size.height * 0.13,
                ),
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
              const SizedBox(height: AppSize.size10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '\$${dish.cost}',
                      style: themeData.textTheme.titleMedium,
                    ),
                  ),
                  ButtonDishCard(
                    label: '+${'homeScreen.add'.tr()}',
                    onPressed: () {
                      cartBloc.add(
                        AddDishToCart(dish: dish),
                      );
                      final SnackBar snackBar = SnackBar(
                        content: Text(
                          'homeScreen.dishAddedToTheCart'.tr(),
                          style: themeData.textTheme.titleMedium!.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: themeData.primaryColor,
                        duration: const Duration(milliseconds: 1500),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
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
