part of 'local_orders_data_provider.dart';

class LocalOrdersDataProviderImpl implements LocalOrdersDataProvider {
  const LocalOrdersDataProviderImpl();

  @override
  Future<void> saveOrdersToCache(List<OrderModel> orders) async {
    final Box<OrderEntity> ordersBox = await Hive.openBox('orders');
    //do i need it??
    await ordersBox.clear();
    final List<OrderEntity> ordersEntity = orders
        .map(
          (OrderModel order) => OrderMapper.toEntity(order),
        )
        .toList();
    await ordersBox.addAll(ordersEntity);
  }

  @override
  Future<List<OrderEntity>> getCachedOrders() async {
    final Box<OrderEntity> ordersBox = await Hive.openBox('orders');
    final List<OrderEntity> ordersEntity = ordersBox.values.toList();
    return ordersEntity;
  }
}