import 'package:core/core.dart';
import 'cart_dish_entity.dart';

class CartDishEntityAdapter extends TypeAdapter<CartDishEntity> {
  @override
  final int typeId = 1;

  @override
  CartDishEntity read(BinaryReader reader) {
    return CartDishEntity(
      dish: reader.read(),
      quantity: reader.read() as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartDishEntity obj) {
    writer.write(obj.dish);
    writer.write(obj.quantity);
  }
}
