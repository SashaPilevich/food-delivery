import 'package:domain/domain.dart';

class FetchOrdersUseCase implements FutureUseCase<String, List<OrderModel>> {
  final OrdersRepository _ordersRepository;

  FetchOrdersUseCase({
    required OrdersRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<List<OrderModel>> execute(String uid) async {
    return _ordersRepository.fetchOrders(uid);
  }
}
