part of 'home_bloc.dart';

class DishesState {
  final bool isLoading;
  final List<DishModel> listOfDishes;
  final List<DishModel> dishesOfSelectedCategory;
  final Object? exception;
  final bool? hasInternetConnection;
  final List<String> categories;

  DishesState({
    this.isLoading = true,
    this.listOfDishes = const [],
    this.dishesOfSelectedCategory = const [],
    this.exception,
    this.hasInternetConnection,
    this.categories = const [],
  });

  DishesState copyWith({
    bool? isLoading,
    List<DishModel>? listOfDishes,
    List<DishModel>? dishesOfSelectedCategory,
    Object? exception,
    bool? hasInternetConnection,
    List<String>? categories,
  }) {
    return DishesState(
      isLoading: isLoading ?? this.isLoading,
      listOfDishes: listOfDishes ?? this.listOfDishes,
      dishesOfSelectedCategory:
          dishesOfSelectedCategory ?? this.dishesOfSelectedCategory,
      exception: exception ?? this.exception,
      hasInternetConnection:
          hasInternetConnection ?? this.hasInternetConnection,
      categories: categories ?? this.categories,
    );
  }
}
