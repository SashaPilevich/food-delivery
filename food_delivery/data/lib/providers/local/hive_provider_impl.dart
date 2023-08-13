import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:domain/domain.dart';

class HiveProviderImpl implements HiveProvider {
  @override
  Future<void> saveDishesToCache(List<DishModel> dishes) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> dishesEntity = dishes
        .map(
          (DishModel dish) => DishMapper.toEntity(dish),
        )
        .toList();

    if (dishesBox.isEmpty) {
      await dishesBox.addAll(dishesEntity);
    } else {
      await dishesBox.clear();
      await dishesBox.addAll(dishesEntity);
    }
  }

  @override
  Future<List<DishEntity>> getCachedDishes() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> dishesEntity = dishesBox.values.toList();
    return dishesEntity;
  }

  @override
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

  @override
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

  @override
  Future<List<CartDishEntity>> getDishesFromCart(String userId) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart$userId');
    final List<CartDishEntity> cartDishEntity = cartDishBox.values.toList();
    return cartDishEntity;
  }

  @override
  Future<void> clearCart(String userId) async {
    final Box<CartDishEntity> cartDishBox = await Hive.openBox('cart$userId');
    cartDishBox.clear();
  }

  @override
  Future<void> saveOrdersToCache(List<OrderModel> orders) async {
    final Box<OrderEntity> ordersBox = await Hive.openBox('orders');
    await ordersBox.clear();
    final List<OrderEntity> ordersEntity = orders
        .map(
          (OrderModel order) => OrderMapper.toEntity(order),
        )
        .toList();
    await ordersBox.addAll(ordersEntity);
  }

  @override
  Future<void> addOrderToCache(OrderModel order) async {
    final Box<OrderEntity> ordersBox = await Hive.openBox('orders');
    await ordersBox.add(OrderMapper.toEntity(order));
  }

  @override
  Future<List<OrderEntity>> getCachedOrders() async {
    final Box<OrderEntity> ordersBox = await Hive.openBox('orders');
    final List<OrderEntity> ordersEntity = ordersBox.values.toList();
    return ordersEntity;
  }

  @override
  Future<void> saveUserToLocal(UserModel userModel) async {
    final Box<UserEntity> userBox = await Hive.openBox('user');
    final UserEntity userEntity = UserMapper.toEntity(userModel);
    await userBox.add(userEntity);
  }

  @override
  Future<UserEntity> getUserFromLocal() async {
    final Box<UserEntity> userBox = await Hive.openBox('user');

    return userBox.isNotEmpty ? userBox.values.first : const UserEntity.empty();
  }

  @override
  Future<void> deleteUserFromLocal() async {
    final Box<UserEntity> userBox = await Hive.openBox('user');
    await userBox.clear();
  }

  @override
  Future<bool> getThemeMode() async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.get('isDark').toString() == 'true' ? true : false;
  }

  @override
  Future<bool> getThemeType() async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.get('isSystemTheme').toString() == 'true' ? true : false;
  }

  @override
  Future<void> setThemeMode(bool isDark) async {
    final Box themeBox = await Hive.openBox('theme');
    themeBox.put('isDark', isDark.toString());
  }

  @override
  Future<void> setThemeType(bool isSystemTheme) async {
    final Box themeBox = await Hive.openBox('theme');
    themeBox.put('isSystemTheme', isSystemTheme.toString());
  }

  @override
  Future<double> getFontSize() async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    return fontSizeBox.get('textScale') ?? 1.0;
  }

  @override
  Future<void> setFontSize(double textScale) async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    fontSizeBox.put('textScale', textScale);
  }
}
