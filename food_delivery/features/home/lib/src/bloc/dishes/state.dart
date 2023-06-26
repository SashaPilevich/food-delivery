part of 'bloc.dart';

class DishesState {
  final bool isLoading;
  final List<DishModel> listOfDishes;
  final Object? exception;

  DishesState({
    this.isLoading = true,
    this.listOfDishes = const [],
    this.exception,
  });

  DishesState copyWith({
    bool? isLoading,
    List<DishModel>? listOfDishes,
    Object? exception,
  }) {
    return DishesState(
      isLoading: isLoading ?? this.isLoading,
      listOfDishes: listOfDishes ?? this.listOfDishes,
      exception: exception ?? this.exception,
    );
  }
}
