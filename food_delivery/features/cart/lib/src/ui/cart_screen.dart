import 'package:cart/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/order_history.dart';
import 'widgets/cart_element.dart';
import 'widgets/modal_bottom_sheet.dart';
import 'widgets/total_price.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderBloc orderBloc = BlocProvider.of(context);
    final CartBloc cartBloc = BlocProvider.of(context);
    
    return Scaffold(
      appBar: CustomAppBar(
        title: 'homePage.cart'.tr(),
      ),
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
                        cartElement: state.cart.dishes[index],
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
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (_) {
                          return const ModalBottomSheet();
                        });
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
              imageUrl: ImagePath.emptyCart,
            );
          }
        },
      ),
    );
  }
}
