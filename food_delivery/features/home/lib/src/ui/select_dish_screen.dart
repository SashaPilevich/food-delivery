import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class SelectDishScreen extends StatelessWidget {
  final DishModel dish;

  const SelectDishScreen({
    required this.dish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(dish.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
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
                      style: textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 370,
                      child: ReadMoreText(
                        dish.description ?? 'Description not available',
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: textTheme.titleSmall,
                        moreStyle: AppTextTheme.robotoCondensed18Regular
                            .copyWith(color: themeData.primaryColor),
                        lessStyle: AppTextTheme.robotoCondensed18Regular
                            .copyWith(color: themeData.primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Ingredients',
                      style: textTheme.titleMedium?.copyWith(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 370,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            ...List.generate(
                                dish.ingredients?.length ?? 0,
                                (index) => TextSpan(
                                      text:
                                          '\u2022${dish.ingredients?[index] ?? ''}',
                                      style: textTheme.titleSmall,
                                    )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Cost: \$${dish.cost}',
                      style: textTheme.titleMedium?.copyWith(
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
    );
  }
}
