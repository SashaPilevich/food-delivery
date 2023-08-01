import 'package:core/core.dart';
import 'cart_dish_entity.dart';
import 'cart_entity.dart';

class CartEntityAdapter extends TypeAdapter<CartEntity> {
  @override
  final int typeId = 3;

  @override
  CartEntity read(BinaryReader reader) {
    final int dishListLength = reader.read() as int;
    final List<CartDishEntity> dishes = <CartDishEntity>[];
    for (int i = 0; i < dishListLength; i++) {
      final CartDishEntity dish = reader.read() as CartDishEntity;
      dishes.add(dish);
    }
    final int totalPrice = reader.read() as int;

    return CartEntity(
      dishes: dishes,
      totalPrice: totalPrice,
    );
  }

  @override
  void write(BinaryWriter writer, CartEntity obj) {
    writer.write(obj.dishes.length);
    for (final CartDishEntity dish in obj.dishes) {
      writer.write(dish);
    }
    writer.write(obj.totalPrice);
  }
}
