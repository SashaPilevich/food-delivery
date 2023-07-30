import 'package:domain/domain.dart';

abstract class OrdersRepository {
  Future<void> addOrder(OrderModel order);
  Future<List<OrderModel>> fetchOrders(String uid);
}
