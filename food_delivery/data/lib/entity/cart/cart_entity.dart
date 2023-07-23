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
}
