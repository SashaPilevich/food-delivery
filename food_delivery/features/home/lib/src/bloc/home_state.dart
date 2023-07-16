part of 'home_bloc.dart';

class DishesState {
  final bool isLoading;
  final List<DishModel> listOfDishes;
  final Object? exception;
  final bool isInternetConnection;

  DishesState({
    this.isLoading = true,
    this.listOfDishes = const [],
    this.exception,
    this.isInternetConnection = true,
  });

  DishesState copyWith({
    bool? isLoading,
    List<DishModel>? listOfDishes,
    Object? exception,
    bool? isInternetConnection,
  }) {
    return DishesState(
      isLoading: isLoading ?? this.isLoading,
      listOfDishes: listOfDishes ?? this.listOfDishes,
      exception: exception ?? this.exception,
      isInternetConnection: isInternetConnection ?? this.isInternetConnection,
    );
  }
}
