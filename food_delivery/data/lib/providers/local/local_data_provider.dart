import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'local_data_provider_impl.dart';

abstract class LocalDataProvider {
  Future<void> saveDishesToCache(List<DishModel> dishes);
  Future<List<DishEntity>> getCachedDishes();
}
