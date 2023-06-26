import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final FetchAllDishesUseCase _fetchAllDishesUseCase;
  List<DishModel> dishes = <DishModel>[];

  DishesBloc({
    required FetchAllDishesUseCase fetchAllDishesUseCase,
  })  : _fetchAllDishesUseCase = fetchAllDishesUseCase,
        super(DishesState()) {
    on<LoadingListOfDishes>(_loadingDishes);
    on<LoadListOfDishes>(_loadDishes);

    add(LoadingListOfDishes());
  }

  Future<void> _loadingDishes(
      LoadingListOfDishes event, Emitter<DishesState> emit) async {
    if (state.listOfDishes.isEmpty) {
      emit(
        state.copyWith(isLoading: true),
      );
      add(LoadListOfDishes());
    } else {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  void _loadDishes(LoadListOfDishes event, Emitter<DishesState> emit) async {
    try {
      dishes = await _fetchAllDishesUseCase.execute(const NoParams());
      emit(state.copyWith(listOfDishes: dishes));
    } catch (e) {
      emit(
        state.copyWith(exception: e),
      );
    }
  }
}
