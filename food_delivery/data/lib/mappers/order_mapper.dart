import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'cart_mapper.dart';

abstract class OrderMapper {
  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.id,
      cart: CartMapper.toEntity(model.cart),
      dateTime: model.dateTime,
    );
  }

  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      cart: CartMapper.toModel(entity.cart),
      dateTime: entity.dateTime,
    );
  }
}
