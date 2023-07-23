import 'package:data/data.dart';

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
}