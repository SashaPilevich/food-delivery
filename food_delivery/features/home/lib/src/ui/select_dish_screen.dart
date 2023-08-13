import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/widgets/button_with_animated_color.dart';
import 'package:settings/settings.dart';
import 'widgets/read_more_text.dart';
import 'widgets/text_rich.dart';

class SelectDishScreen extends StatelessWidget {
  final DishModel dish;

  const SelectDishScreen({
    required this.dish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(dish.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: AppPadding.padding30,
          left: AppPadding.padding20,
          right: AppPadding.padding20,
          bottom: AppPadding.padding30,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Hero(
                tag: dish.imageUrl,
                child: AppCacheImage(
                  imageUrl: dish.imageUrl,
                  height: mediaQueryData.size.height * 0.35,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.size30,
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (_, SettingsState state) {
                return Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dish.title,
                          style: themeData.textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: AppSize.size30,
                        ),
                        SizedBox(
                          width: mediaQueryData.size.width * 0.9,
                          child: CustomReadMoreText(
                            text: dish.description,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.size30,
                        ),
                        Text(
                          'selectDishScreen.ingredients'.tr(),
                          style: themeData.textTheme.titleMedium?.copyWith(
                            color: state.isSystemTheme
                                ? AppColors.darkGrey
                                : themeData.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.size20,
                        ),
                        SizedBox(
                          width: mediaQueryData.size.width * 0.9,
                          child: CustomTextRich(
                            listOfIngredients: dish.ingredients,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.size30,
                        ),
                        Text(
                          '${'selectDishScreen.cost'.tr()}: \$${dish.cost}',
                          style: themeData.textTheme.titleMedium?.copyWith(
                            color: state.isSystemTheme
                                ? AppColors.darkGrey
                                : themeData.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.size20,
                        ),
                        ButtonWithAnimatedColor(
                          onPressed: () {
                            cartBloc.add(
                              AddDishToCart(dish: dish),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
