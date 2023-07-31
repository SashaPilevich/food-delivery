part of 'home_bloc.dart';

abstract class DishesEvent {
  const DishesEvent();
}

class InitListOfDishes extends DishesEvent {
  InitListOfDishes();
}

class LoadListOfDishes extends DishesEvent {
  LoadListOfDishes();
}

class FilterDishesByCategory extends DishesEvent {
  final String category;

  FilterDishesByCategory({
    required this.category,
  });
}

class CheckInternetConnection extends DishesEvent {
  CheckInternetConnection();
}
