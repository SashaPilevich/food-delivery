part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class InitCart extends CartEvent {}

class AddDishToCart extends CartEvent {
  final DishModel dish;

  AddDishToCart({
    required this.dish,
  });
}

class RemoveDishFromCart extends CartEvent {
  final CartDish cartDish;

  RemoveDishFromCart({
    required this.cartDish,
  });
}
