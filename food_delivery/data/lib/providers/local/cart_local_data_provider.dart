import 'package:core/core.dart';
import 'package:data/data.dart';



class CartLocalDataProvider {
  CartLocalDataProvider();

  Future<void> addDishToCart(DishEntity dish) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart');
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

  Future<void> removeDishFromCart(CartDishEntity cartDishEntity) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart');

    if (cartDishEntity.quantity > 1) {
      cartDishEntity.quantity--;
      cartDishBox.put(cartDishEntity.dish.title, cartDishEntity);
    } else {
      cartDishBox.delete(cartDishEntity.dish.title);
    }
  }

  Future<List<CartDishEntity>> getDishesFromCart() async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart');
    final List<CartDishEntity> cartDishEntity = cartDishBox.values.toList();
    return cartDishEntity;
  }
}
