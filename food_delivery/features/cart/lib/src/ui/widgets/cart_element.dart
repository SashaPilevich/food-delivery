import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

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

    return InkWell(
      onTap: () {
        context.navigateTo(
          SelectDishScreenRoute(
            dish: cartElement.dish,
          ),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.padding15,
            vertical: AppPadding.padding20,
          ),
          child: Row(
            children: <Widget>[
              Hero(
                tag: cartElement.dish.imageUrl,
                child: AppCacheImage(
                  imageUrl: cartElement.dish.imageUrl,
                  height: mediaQueryData.size.height * 0.13,
                ),
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
              ButtonDishQuantity(
                increaseQuantity: () {
                  cartBloc.add(
                    AddDishToCart(
                      dish: cartElement.dish,
                    ),
                  );
                },
                decreaseQuantity: () {
                  cartBloc.add(
                    RemoveDishFromCart(
                      cartDish: cartElement,
                    ),
                  );
                },
                quantity: '${cartElement.quantity}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
