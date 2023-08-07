import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'button_dish_card.dart';
import 'change_dish_quantity.dart';

class AnimatedAddToCartButton extends StatefulWidget {
  final DishModel dish;

  const AnimatedAddToCartButton({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  State<AnimatedAddToCartButton> createState() =>
      _AnimatedAddToCartButtonState();
}

class _AnimatedAddToCartButtonState extends State<AnimatedAddToCartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationMove;

  Iterable<CartDish> _findCartItem(CartState state) {
    return state.cart.dishes.where(
      (CartDish element) => element.dish.title == widget.dish.title,
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationMove = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(1, 1),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState state) {
        if (_findCartItem(state).isNotEmpty) {
          return SlideTransition(
            position: _animationMove,
            child: ChangeDishQuantity(
              increaseQuantity: () {
                cartBloc.add(
                  AddDishToCart(
                    dish: _findCartItem(state).first.dish,
                  ),
                );
              },
              decreaseQuantity: () {
                if (_findCartItem(state).first.quantity == 1) {
                  _controller.reverse(from: 1);
                }
                cartBloc.add(
                  RemoveDishFromCart(
                    cartDish: _findCartItem(state).first,
                  ),
                );
              },
              quantity: '${_findCartItem(state).first.quantity}',
            ),
          );
        }
        return SlideTransition(
          position: _animationMove,
          child: ButtonDishCard(
            label: '+${'homeScreen.add'.tr()}',
            onPressed: () {
              _controller.reverse(from: 1);
              cartBloc.add(
                AddDishToCart(dish: widget.dish),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
