import 'package:core/core.dart';
import 'package:data/data.dart';

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 4;

  @override
  OrderEntity read(BinaryReader reader) {
    final id = reader.read() as String;
    final cart = reader.read() as CartEntity;
    final dateTime = reader.read() as DateTime;

    return OrderEntity(
      id: id,
      cart: cart,
      dateTime: dateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer.write(obj.id);
    writer.write(obj.cart);
    writer.write(obj.dateTime);
  }
}
