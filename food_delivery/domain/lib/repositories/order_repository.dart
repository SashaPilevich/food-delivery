import 'package:domain/domain.dart';

abstract class OrderRepository {
  Future<void> addOrder(OrderModel order);
  Future<List<OrderModel>> fetchOrders(String uid);
}
