import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(dish.title),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: AppPadding.padding_30,
            left: AppPadding.padding_20,
            right: AppPadding.padding_20,
            bottom: AppPadding.padding_30,
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: ImageDishSelect(imageUrl: dish.imageUrl),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        dish.title,
                        style: themeData.textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: AppSize.size_30,
                      ),
                      SizedBox(
                        width: mediaQueryData.size.width * 0.9,
                        child: CustomReadMoreText(
                          text: dish.description,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.size_30,
                      ),
                      Text(
                        'ingredients'.tr(),
                        style: themeData.textTheme.titleMedium?.copyWith(
                          color: themeData.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.size_20,
                      ),
                      SizedBox(
                        width: mediaQueryData.size.width * 0.9,
                        child: CustomTextRich(
                          listOfIngredients: dish.ingredients,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.size_30,
                      ),
                      Text(
                        '${'cost'.tr()}: \$${dish.cost}',
                        style: themeData.textTheme.titleMedium?.copyWith(
                          color: themeData.primaryColor,
                        ),
                      ),
                    ],
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
