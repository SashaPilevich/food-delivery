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
