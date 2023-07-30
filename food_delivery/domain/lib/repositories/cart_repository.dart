import 'package:domain/domain.dart';

abstract class CartRepository {
  Future<List<CartDish>> getDishesFromCart();
  Future<void> addDishToCart(DishModel dish);
  Future<void> removeDishFromCart(CartDish cartDish);
  Future<void> clearCart();
}
