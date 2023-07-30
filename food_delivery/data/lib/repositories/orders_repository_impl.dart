import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:domain/domain.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersDataProvider _ordersDataProvider;
  final LocalOrdersDataProvider _localOrdersDataProvider;

  const OrdersRepositoryImpl({
    required OrdersDataProvider ordersDataProvider,
    required LocalOrdersDataProvider localOrdersDataProvider,
  })  : _ordersDataProvider = ordersDataProvider,
        _localOrdersDataProvider = localOrdersDataProvider;

  @override
  Future<void> addOrder(OrderModel orderModel) async {
    final OrderEntity orderEntity = OrderMapper.toEntity(orderModel);
    await _ordersDataProvider.addOrder(orderEntity);
    await _localOrdersDataProvider.addOrderToCache(orderModel);
  }

  @override
  Future<List<OrderModel>> fetchOrders(String uid) async {
    final List<OrderModel> orders;

    if (await InternetConnectionInfo.checkInternetConnection()) {
      final List<OrderEntity> result =
          await _ordersDataProvider.fetchOrders(uid);
      orders = result
          .map((OrderEntity order) => OrderMapper.toModel(order))
          .toList();
      await _localOrdersDataProvider.saveOrdersToCache(orders);
    } else {
      final List<OrderEntity> result =
          await _localOrdersDataProvider.getCachedOrders();
      orders = result
          .map((OrderEntity order) => OrderMapper.toModel(order))
          .toList();
    }
    return orders;
  }
}
