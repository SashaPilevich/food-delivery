import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:domain/domain.dart';

part 'local_orders_data_provider_impl.dart';

abstract class LocalOrdersDataProvider {
  Future<void> saveOrdersToCache(List<OrderModel> orders);
  Future<void> addOrderToCache(OrderModel order);
  Future<List<OrderEntity>> getCachedOrders();
}
