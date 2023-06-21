import 'package:domain/models/dish/dish_model.dart';

abstract class DishesRepository {
  Future<List<DishModel>> fetchAllDishes();
}
