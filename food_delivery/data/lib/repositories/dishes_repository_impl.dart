import 'package:data/entity/dish_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:data/providers/data_provider.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/dish/dish_model.dart';

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
