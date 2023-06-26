import 'package:core/core.dart';
import 'package:data/data.dart';

part 'data_provider_impl.dart';

abstract class DataProvider {
  Future<List<DishEntity>> getAllDishes();
}
