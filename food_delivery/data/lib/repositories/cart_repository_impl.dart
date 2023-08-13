import 'package:data/data.dart';
import 'package:data/mappers/cart_dish_mapper.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final HiveProvider _hiveProvider;

  CartRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<List<CartDish>> getDishesFromCart({
    required String userId,
  }) async {
    final List<CartDishEntity> cartDishEntity =
        await _hiveProvider.getDishesFromCart(userId);
    return cartDishEntity.map((CartDishEntity dishEntity) {
      return CartDishMapper.toModel(dishEntity);
    }).toList();
  }

  @override
  Future<void> addDishToCart({
    required DishModel dish,
    required String userId,
  }) async {
    final DishEntity dishEntity = DishMapper.toEntity(dish);
    await _hiveProvider.addDishToCart(
      dish: dishEntity,
      userId: userId,
    );
  }

  @override
  Future<void> removeDishFromCart({
    required CartDish cartDish,
    required String userId,
  }) async {
    final CartDishEntity cartDishEntity = CartDishMapper.toEntity(cartDish);
    await _hiveProvider.removeDishFromCart(
      cartDishEntity: cartDishEntity,
      userId: userId,
    );
  }

  @override
  Future<void> clearCart({
    required String userId,
  }) async {
    await _hiveProvider.clearCart(userId);
  }
}
