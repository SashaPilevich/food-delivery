import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:domain/domain.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;
  final HiveProvider _hiveProvider;

  const OrderRepositoryImpl({
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<void> addOrder(OrderModel orderModel) async {
    final OrderEntity orderEntity = OrderMapper.toEntity(orderModel);
    await _firebaseFirestoreDataProvider.addOrder(orderEntity);
    await _hiveProvider.addOrderToCache(orderModel);
  }

  @override
  Future<List<OrderModel>> fetchOrders(String uid) async {
    final List<OrderModel> orders;
    final bool hasInternetConnection =
        await InternetConnectionInfo.checkInternetConnection();

    if (hasInternetConnection) {
      final List<OrderEntity> result =
          await _firebaseFirestoreDataProvider.fetchOrders(uid);
      orders = result
          .map((OrderEntity order) => OrderMapper.toModel(order))
          .toList();
      await _hiveProvider.saveOrdersToCache(orders);
    } else {
      final List<OrderEntity> result = await _hiveProvider.getCachedOrders();
      orders = result
          .map((OrderEntity order) => OrderMapper.toModel(order))
          .toList();
    }
    return orders;
  }
}
