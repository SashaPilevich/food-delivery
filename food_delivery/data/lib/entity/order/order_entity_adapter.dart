import 'package:core/core.dart';
import 'package:data/data.dart';

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 4;

  @override
  OrderEntity read(BinaryReader reader) {
    final String id = reader.read() as String;
    final CartEntity cart = reader.read() as CartEntity;
    final DateTime dateTime = reader.read() as DateTime;
    final bool isComplete = reader.read() as bool;

    return OrderEntity(
      id: id,
      cart: cart,
      dateTime: dateTime,
      isComplete: isComplete,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer.write(obj.id);
    writer.write(obj.cart);
    writer.write(obj.dateTime);
    writer.write(obj.isComplete);
  }
}
