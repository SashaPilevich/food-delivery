part of 'local_data_provider.dart';

class LocalDataProviderImpl implements LocalDataProvider {
  LocalDataProviderImpl();

  @override
  Future<void> saveDishesToCache(List<DishModel> dishes) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    if (dishesBox.isEmpty) {
      final List<DishEntity> dishesEntity = dishes
          .map(
            (DishModel dish) => DishMapper.toEntity(dish),
          )
          .toList();
      await dishesBox.addAll(dishesEntity);
    }
  }

  @override
  Future<List<DishEntity>> getCachedDishes() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> dishesEntity = dishesBox.values.toList();
    return dishesEntity;
  }
}