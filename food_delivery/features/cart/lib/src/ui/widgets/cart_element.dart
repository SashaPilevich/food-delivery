import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CartElement extends StatelessWidget {
  final CartDish cartElement;

  const CartElement({
    required this.cartElement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Card(
      child: Container(
        padding: const EdgeInsets.only(
          top: AppPadding.padding20,
          left: AppPadding.padding15,
          right: AppPadding.padding15,
          bottom: AppPadding.padding20,
        ),
        child: Row(
          children: <Widget>[
            AppImage(
              src: cartElement.dish.imageUrl,
              height: mediaQueryData.size.height * 0.13,
            ),
            const SizedBox(
              width: AppSize.size30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cartElement.dish.title,
                    style: themeData.textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: AppSize.size10,
                  ),
                  Text(
                    '\$${cartElement.dish.cost}',
                    style: themeData.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    cartBloc.add(
                          RemoveDishFromCart(dish: cartElement.dish),
                        );
                  },
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: themeData.primaryColor,
                  ),
                ),
                Text(
                  '${cartElement.quantity}',
                  style: themeData.textTheme.headlineMedium,
                ),
                IconButton(
                  onPressed: () {
                    cartBloc.add(
                          AddDishToCart(dish: cartElement.dish),
                        );
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
