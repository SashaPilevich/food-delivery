import 'package:core/core.dart';
import 'package:data/data.dart';

class CartLocalDataProvider {
  const CartLocalDataProvider();

  Future<void> addDishToCart({
    required DishEntity dish,
    required String userId,
  }) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart$userId');
    final List<CartDishEntity> cartDishesEntity = cartDishBox.values.toList();
    bool isDishExist = false;

    for (int i = 0; i < cartDishesEntity.length; i++) {
      if (!isDishExist && cartDishesEntity[i].dish.title == dish.title) {
        cartDishesEntity[i].quantity++;
        cartDishBox.put(
          cartDishesEntity[i].dish.title,
          cartDishesEntity[i],
        );
        isDishExist = true;
      }
    }

    if (!isDishExist) {
      cartDishBox.put(
        dish.title,
        CartDishEntity(
          dish: dish,
          quantity: 1,
        ),
      );
    }
  }

  Future<void> removeDishFromCart({
    required CartDishEntity cartDishEntity,
    required String userId,
  }) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart$userId');

    if (cartDishEntity.quantity > 1) {
      cartDishEntity.quantity--;
      cartDishBox.put(cartDishEntity.dish.title, cartDishEntity);
    } else {
      cartDishBox.delete(cartDishEntity.dish.title);
    }
  }

  Future<List<CartDishEntity>> getDishesFromCart(String userId) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart$userId');
    final List<CartDishEntity> cartDishEntity = cartDishBox.values.toList();
    return cartDishEntity;
  }

  Future<void> clearCart(String userId) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart$userId');
    cartDishBox.clear();
  }
}
