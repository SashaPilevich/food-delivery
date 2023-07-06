import 'package:domain/domain.dart';

class CartModel {
  final List<CartDish> dishes;
  final int totalPrice;

  const CartModel({
    required this.dishes,
    required this.totalPrice,
  });

  CartModel copyWith({
    List<CartDish>? dishes,
    int? totalPrice,
  }) {
    return CartModel(
      dishes: dishes ?? this.dishes,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  List<Object?> get props => [
        dishes,
        totalPrice,
      ];
}
