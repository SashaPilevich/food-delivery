import 'package:domain/domain.dart';

class FetchOrdersUseCase implements FutureUseCase<String, List<OrderModel>> {
  final OrderRepository _orderRepository;

  FetchOrdersUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<List<OrderModel>> execute(String uid) async {
    return _orderRepository.fetchOrders(uid);
  }
}
