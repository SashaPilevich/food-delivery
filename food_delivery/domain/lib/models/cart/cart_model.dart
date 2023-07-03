import 'package:domain/domain.dart';

class CartModel {
  final Map<DishModel, int> cartItems;
  final int totalPrice;

  const CartModel({
    required this.cartItems,
    required this.totalPrice,
  });

  List<Object?> get props => [
        cartItems,
        totalPrice,
      ];

  CartModel copyWith({
    Map<DishModel, int>? cartItems,
    int? totalPrice,
  }) {
    return CartModel(
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
