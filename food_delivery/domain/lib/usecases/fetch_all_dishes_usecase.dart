import 'package:domain/domain.dart';

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
