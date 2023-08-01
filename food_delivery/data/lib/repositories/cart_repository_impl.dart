import 'package:data/data.dart';
import 'package:data/mappers/cart_dish_mapper.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataProvider _cartLocalDataProvider;

  CartRepositoryImpl({
    required CartLocalDataProvider cartLocalDataProvider,
  }) : _cartLocalDataProvider = cartLocalDataProvider;

  @override
  Future<List<CartDish>> getDishesFromCart() async {
    final List<CartDishEntity> cartDishEntity =
        await _cartLocalDataProvider.getDishesFromCart();
    return cartDishEntity
        .map((CartDishEntity dishEntity) => CartDishMapper.toModel(dishEntity))
        .toList();
  }

  @override
  Future<void> addDishToCart(DishModel dish) async {
    final DishEntity dishEntity = DishMapper.toEntity(dish);
    await _cartLocalDataProvider.addDishToCart(dishEntity);
  }

  @override
  Future<void> removeDishFromCart(CartDish cartDish) async {
    final CartDishEntity cartDishEntity = CartDishMapper.toEntity(cartDish);
    await _cartLocalDataProvider.removeDishFromCart(cartDishEntity);
  }

  @override
  Future<void> clearCart() async {
    await _cartLocalDataProvider.clearCart();
  }
}
