part of 'cart_bloc.dart';

class CartState {
  final CartModel cart;

  CartState.empty(this.cart);

  CartState copyWith({
    CartModel? cart,
  }) {
    return CartState.empty(
      cart ?? this.cart,
    );
  }
}
