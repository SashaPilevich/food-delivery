part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class InitCart extends CartEvent {}

class AddDishToCart extends CartEvent {
  final DishModel dish;

  const AddDishToCart({
    required this.dish,
  });
}

class RemoveDishFromCart extends CartEvent {
  final CartDish cartDish;

  const RemoveDishFromCart({
    required this.cartDish,
  });
}

class ClearCart extends CartEvent {
  const ClearCart();
}

class NavigateToSelectedDishScreen extends CartEvent {
  final DishModel dishModel;

  const NavigateToSelectedDishScreen({
    required this.dishModel,
  });
}

class NavigateToCurrentScreen extends CartEvent {
  const NavigateToCurrentScreen();
}
