import 'package:data/data.dart';

abstract class OrdersDataProvider {
  Future<void> addOrder(OrderEntity orderEntity);
  Future<List<OrderEntity>> fetchOrders(String uid);
}
