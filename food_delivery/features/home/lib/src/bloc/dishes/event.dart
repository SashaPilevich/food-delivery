part of 'bloc.dart';

abstract class DishesEvent {
  const DishesEvent();
}

class LoadingListOfDishes extends DishesEvent {
  LoadingListOfDishes();
}

class LoadListOfDishes extends DishesEvent {
  LoadListOfDishes();
}
