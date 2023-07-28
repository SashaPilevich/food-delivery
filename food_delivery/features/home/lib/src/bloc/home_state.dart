part of 'home_bloc.dart';

class DishesState {
  final bool isLoading;
  final List<DishModel> listOfDishes;
  final Object? exception;
  final bool? hasInternetConnection;

  DishesState({
    this.isLoading = true,
    this.listOfDishes = const [],
    this.exception,
    this.hasInternetConnection,
  });

  DishesState copyWith({
    bool? isLoading,
    List<DishModel>? listOfDishes,
    Object? exception,
    bool? hasInternetConnection,
  }) {
    return DishesState(
      isLoading: isLoading ?? this.isLoading,
      listOfDishes: listOfDishes ?? this.listOfDishes,
      exception: exception ?? this.exception,
      hasInternetConnection:
          hasInternetConnection ?? this.hasInternetConnection,
    );
  }
}
