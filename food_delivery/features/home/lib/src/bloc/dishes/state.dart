part of 'bloc.dart';

abstract class DishesState {}

class DishesInitialState extends DishesState {}

class DishesLoadingState extends DishesState {}

class DishesLoadedState extends DishesState {
  final List<DishModel> listOfDishes;

  DishesLoadedState({
    required this.listOfDishes,
  });
}

class DishesErrorState extends DishesState {
  final Object? exception;

  DishesErrorState({
    required this.exception,
  });
}
