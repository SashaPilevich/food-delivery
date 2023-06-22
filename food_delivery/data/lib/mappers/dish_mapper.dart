import 'package:data/entity/dish_entity.dart';
import 'package:domain/domain.dart';


abstract class DishMapper {
  static DishEntity toEntity(DishModel model) {
    return DishEntity(
      id: model.id,
      title: model.title,
      imageUrl: model.imageUrl,
      cost: model.cost,
      description: model.description,
      ingredients: model.ingredients,
      category: model.category,
    );
  }

  static DishModel toModel(DishEntity entity) {
    return DishModel(
      id: entity.id,
      title: entity.title,
      imageUrl: entity.imageUrl,
      cost: entity.cost,
      description: entity.description,
      ingredients: entity.ingredients,
      category: entity.category,
    );
  }
}
