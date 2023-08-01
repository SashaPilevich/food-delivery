part of 'order_bloc.dart';

abstract class OrderEvent {
  const OrderEvent();
}

class InitListOfOrders extends OrderEvent {
  InitListOfOrders();
}

class LoadOrders extends OrderEvent {
  LoadOrders();
}

class AddOrder extends OrderEvent {
  final OrderModel order;

  AddOrder({
    required this.order,
  });
}
