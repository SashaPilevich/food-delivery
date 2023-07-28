part of 'cart_bloc.dart';

class CartState {
  final CartModel cart;

  CartState({
    required this.cart,
  });

  CartState.empty()
      : cart = const CartModel(
          dishes: [],
          totalPrice: 0,
        );

  CartState copyWith({
    CartModel? cart,
  }) {
    return CartState(
      cart: cart ?? this.cart,
    );
  }
}
