import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CartElement extends StatelessWidget {
  final DishModel cartElement;
  final int quantity;

  const CartElement({
    required this.cartElement,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Card(
      child: Container(
        padding: const EdgeInsets.only(
            top: AppPadding.padding_20,
            left: AppPadding.padding_15,
            right: AppPadding.padding_15,
            bottom: AppPadding.padding_20),
        child: Row(
          children: <Widget>[
            ImageDishCart(imageUrl: cartElement.imageUrl),
            const SizedBox(
              width: AppSize.size_30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cartElement.title,
                    style: themeData.textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: AppSize.size_10,
                  ),
                  Text(
                    '\$${cartElement.cost}',
                    style: themeData.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(RemoveDishFromCart(dish: cartElement));
                  },
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: themeData.primaryColor,
                  ),
                ),
                Text(
                  '$quantity',
                  style: themeData.textTheme.headlineMedium,
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(AddDishToCart(dish: cartElement));
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: themeData.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
