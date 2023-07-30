import 'cart_dish_entity.dart';

class CartEntity {
  final List<CartDishEntity> dishes;
  final int totalPrice;

  const CartEntity({
    required this.dishes,
    required this.totalPrice,
  });

  List<Object?> get props => [
        dishes,
        totalPrice,
      ];

  Map<String, dynamic> toJson() {
    return {
      'dishes': dishes.map((dish) => dish.toJson()).toList(),
      'totalPrice': totalPrice,
    };
  }

  factory CartEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return CartEntity(
      dishes: (json['dishes'] as List<dynamic>)
          .map((dish) => CartDishEntity.fromJson(dish))
          .toList(),
      totalPrice: json['totalPrice'] ?? 0,
    );
  }
}
