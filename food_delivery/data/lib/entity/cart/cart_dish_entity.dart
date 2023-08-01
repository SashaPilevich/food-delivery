import 'package:data/entity/dish/dish_entity.dart';

class CartDishEntity {
  final DishEntity dish;
  int quantity;

  CartDishEntity({
    required this.dish,
    required this.quantity,
  });

  List<Object?> get props => [
        dish,
        quantity,
      ];

  Map<String, dynamic> toJson() {
    return {
      'dish': dish.toJson(),
      'quantity': quantity,
    };
  }

  factory CartDishEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return CartDishEntity(
      dish: DishEntity.fromJson(json['dish']),
      quantity: json['quantity'],
    );
  }
}
