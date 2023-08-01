part of 'cart_bloc.dart';

class CartState {
  final CartModel cart;
  final String userUid;

  CartState({
    required this.cart,
    required this.userUid,
  });

  CartState.empty()
      : cart = const CartModel(
          dishes: [],
          totalPrice: 0,
        ),
        userUid = '';

  CartState copyWith({
    CartModel? cart,
    String? userUid,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      userUid: userUid ?? this.userUid,
    );
  }
}
