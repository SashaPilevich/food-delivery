import 'package:core/core.dart';
import 'package:domain/models/dish/dish_model.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final FetchAllDishesUseCase _fetchAllDishesUseCase;
  List<DishModel> dishes = <DishModel>[];

  DishesBloc({
    required FetchAllDishesUseCase fetchAllDishesUseCase,
  })  : _fetchAllDishesUseCase = fetchAllDishesUseCase,
        super(DishesInitialState()) {
    on<LoadListOfDishes>(_loadDishes);
  }

  void _loadDishes(LoadListOfDishes event, Emitter<DishesState> emit) async {
    emit(DishesLoadingState());
    try {
      dishes = await _fetchAllDishesUseCase.execute(const NoParams());
      emit(DishesLoadedState(listOfDishes: dishes));
    } catch (e) {
      emit(DishesErrorState(exception: e));
    }
  }
}
