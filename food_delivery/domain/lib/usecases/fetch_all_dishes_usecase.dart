import 'package:domain/models/dish/dish_model.dart';
import 'package:domain/repositories/dishes_repository.dart';
import 'package:domain/usecases/usecase.dart';

class FetchAllDishesUseCase
    implements FutureUseCase<NoParams, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const FetchAllDishesUseCase({required DishesRepository dishesRepository})
      : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(NoParams input) async {
    return _dishesRepository.fetchAllDishes();
  }
}
