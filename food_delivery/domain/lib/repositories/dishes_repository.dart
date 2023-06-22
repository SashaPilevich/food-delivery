import 'package:domain/domain.dart';

abstract class DishesRepository {
  Future<List<DishModel>> fetchAllDishes();
}
