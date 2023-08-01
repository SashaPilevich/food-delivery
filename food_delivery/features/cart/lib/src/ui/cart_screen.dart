import 'package:cart/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/order_history.dart';
import 'widgets/cart_element.dart';
import 'widgets/total_price.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderBloc orderBloc = BlocProvider.of(context);
    final CartBloc cartBloc = BlocProvider.of(context);

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
                  onPressed: () {
                    orderBloc.add(
                      AddOrder(
                        order: OrderModel(
                          id: state.userUid,
                          cart: state.cart,
                          dateTime: DateTime.now(),
                        ),
                      ),
                    );
                    _showSnackBar(
                      context,
                      'cartScreen.acceptedOrder'.tr(),
                    );
                    cartBloc.add(ClearCart());
                  },
                ),
              ],
            );
          } else {
            return EmptyContent(
              title: 'cartScreen.yourShoppingCartIsEmpty'.tr(),
              onPressed: () {
                context.navigateTo(const HomeScreenRoute());
              },
            );
          }
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final ThemeData themeData = Theme.of(context);
    final SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: themeData.textTheme.titleMedium!.copyWith(
          color: AppColors.white,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: themeData.primaryColor,
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
