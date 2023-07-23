import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class DishesRepositoryImpl implements DishesRepository {
  final DataProvider _dataProvider;
  final LocalDataProvider _localDataProvider;

  const DishesRepositoryImpl({
    required DataProvider dataProvider,
    required LocalDataProvider localDataProvider,
  })  : _dataProvider = dataProvider,
        _localDataProvider = localDataProvider;

  @override
  Future<List<DishModel>> fetchAllDishes() async {
    final List<DishModel> dishes;

    if (await InternetConnectionInfo.checkInternetConnection()) {
      final List<DishEntity> result = await _dataProvider.getAllDishes();
      dishes = result.map((DishEntity e) => DishMapper.toModel(e)).toList();
      await _localDataProvider.saveDishesToCache(dishes);
    } else {
      final List<DishEntity> result =
          await _localDataProvider.getCachedDishes();
      dishes = result.map((DishEntity e) => DishMapper.toModel(e)).toList();
    }
    return dishes;
  }
}
