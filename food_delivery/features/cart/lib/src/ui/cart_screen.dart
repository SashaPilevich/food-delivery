import 'package:cart/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (BuildContext context) => CartBloc(),
      child: Scaffold(
        body: BlocBuilder<CartBloc, CartState>(
          builder: (BuildContext context, CartState state) {
            if (state.cart.cartItems.isNotEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(AppPadding.padding_10),
                      itemCount: state.cart.cartItems.keys.length,
                      itemBuilder: (context, index) {
                        return CartElement(
                          cartElement:
                              state.cart.cartItems.keys.elementAt(index),
                          quantity: state.cart.cartItems.entries
                              .elementAt(index)
                              .value,
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
      ),
    );
  }
}
