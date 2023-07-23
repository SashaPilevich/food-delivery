import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class CartMapper {
  static CartEntity toEntity(CartModel model) {
    final dishes = model.dishes
        .map((dish) => CartDishEntity(
              dish: DishMapper.toEntity(dish.dish),
              quantity: dish.quantity,
            ))
        .toList();

    return CartEntity(
      dishes: dishes,
      totalPrice: model.totalPrice,
    );
  }

  static CartModel toModel(CartEntity model) {
    final dishes = model.dishes
        .map((dish) => CartDish(
              dish: DishMapper.toModel(dish.dish),
              quantity: dish.quantity,
            ))
        .toList();

    return CartModel(
      dishes: dishes,
      totalPrice: model.totalPrice,
    );
  }
}
