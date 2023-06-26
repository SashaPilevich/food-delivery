import 'package:data/data.dart';
import 'package:domain/domain.dart';

class DishesRepositoryImpl implements DishesRepository {
  final DataProvider _dataProvider;

  const DishesRepositoryImpl({
    required DataProvider dataProvider,
  }) : _dataProvider = dataProvider;

  @override
  Future<List<DishModel>> fetchAllDishes() async {
    final List<DishEntity> result = await _dataProvider.getAllDishes();
    return result.map((DishEntity e) => DishMapper.toModel(e)).toList();
  }
}
