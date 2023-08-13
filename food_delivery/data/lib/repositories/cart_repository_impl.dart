import 'package:data/data.dart';
import 'package:data/mappers/cart_dish_mapper.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataProvider _cartLocalDataProvider;

  CartRepositoryImpl({
    required CartLocalDataProvider cartLocalDataProvider,
  }) : _cartLocalDataProvider = cartLocalDataProvider;

  @override
  Future<List<CartDish>> getDishesFromCart({
    required String userId,
  }) async {
    final List<CartDishEntity> cartDishEntity =
        await _cartLocalDataProvider.getDishesFromCart(userId);
    return cartDishEntity
        .map((CartDishEntity dishEntity) => CartDishMapper.toModel(dishEntity))
        .toList();
  }

  @override
  Future<void> addDishToCart({
    required DishModel dish,
    required String userId,
  }) async {
    final DishEntity dishEntity = DishMapper.toEntity(dish);
    await _cartLocalDataProvider.addDishToCart(
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
    await _cartLocalDataProvider.removeDishFromCart(
      cartDishEntity: cartDishEntity,
      userId: userId,
    );
  }

  @override
  Future<void> clearCart({
    required String userId,
  }) async {
    await _cartLocalDataProvider.clearCart(userId);
  }
}
