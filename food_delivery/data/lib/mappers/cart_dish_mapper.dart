import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class CartDishMapper {
  static CartDishEntity toEntity(CartDish model) {
    return CartDishEntity(
      dish: DishMapper.toEntity(model.dish),
      quantity: model.quantity,
    );
  }

  static CartDish toModel(CartDishEntity entity) {
    return CartDish(
      dish:DishMapper.toModel(entity.dish),
      quantity: entity.quantity,
    );
  }
}
