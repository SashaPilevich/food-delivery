import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final FetchAllDishesUseCase _fetchAllDishesUseCase;

  DishesBloc({
    required FetchAllDishesUseCase fetchAllDishesUseCase,
  })  : _fetchAllDishesUseCase = fetchAllDishesUseCase,
        super(DishesState()) {
    on<InitListOfDishes>(_initDishes);
    on<LoadListOfDishes>(_loadDishes);
    on<FilterDishesByCategory>(_filterDishes);
    on<CheckInternetConnection>(_checkInternetConnection);

    add(InitListOfDishes());

    Connectivity().onConnectivityChanged.listen((
      ConnectivityResult result,
    ) {
      add(CheckInternetConnection());
    });
  }

  Future<void> _initDishes(
    InitListOfDishes event,
    Emitter<DishesState> emit,
  ) async {
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

  Future<void> _loadDishes(
    LoadListOfDishes event,
    Emitter<DishesState> emit,
  ) async {
    try {
      final List<DishModel> dishes = await _fetchAllDishesUseCase.execute(
        const NoParams(),
      );
      final List<String> categories = dishes
          .map((dish) {
            return dish.category!;
          })
          .toSet()
          .toList();
      categories.insert(0, 'All');
      emit(
        state.copyWith(
          listOfDishes: dishes,
          categories: categories,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(exception: error),
      );
    }
  }

  Future<void> _filterDishes(
    FilterDishesByCategory event,
    Emitter<DishesState> emit,
  ) async {
    final List<DishModel> dishes = List.of(state.listOfDishes);
    final List<DishModel> dishesOfSelectedCategory =
        dishes.where((dish) => dish.category == event.category).toList();
    event.category == 'All'
        ? emit(
            state.copyWith(
              listOfDishes: dishes,
              dishesOfSelectedCategory: [],
            ),
          )
        : emit(
            state.copyWith(
              dishesOfSelectedCategory: dishesOfSelectedCategory,
            ),
          );
  }

  Future<void> _checkInternetConnection(
    CheckInternetConnection event,
    Emitter<DishesState> emit,
  ) async {
    final bool hasInternetConnection =
        await InternetConnectionInfo.checkInternetConnection();
    emit(
      state.copyWith(hasInternetConnection: hasInternetConnection),
    );
  }
}
