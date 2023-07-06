import 'package:cart/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'widgets/cart_element.dart';
import 'widgets/empty_cart.dart';
import 'widgets/total_price.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (_, CartState state) {
          if (state.cart.dishes.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppPadding.padding10),
                    itemCount: state.cart.dishes.length,
                    itemBuilder: (_, int index) {
                      return CartElement(
                        cartElement: state.cart.dishes.elementAt(index),
                      );
                    },
                  ),
                ),
                TotalPrice(
                  totalPrice: state.cart.totalPrice,
                  onPressed: () {},
                ),
              ],
            );
          } else {
            return EmptyCart(
              onPressed: () {
                context.navigateTo(const HomeScreenRoute());
              },
            );
          }
        },
      ),
    );
  }
}
