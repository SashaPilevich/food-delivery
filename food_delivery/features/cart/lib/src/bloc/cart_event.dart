part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddDishToCart extends CartEvent {
  final DishModel dish;

  AddDishToCart({
    required this.dish,
  });
}

class RemoveDishFromCart extends CartEvent {
  final DishModel dish;

  RemoveDishFromCart({
    required this.dish,
  });
}
