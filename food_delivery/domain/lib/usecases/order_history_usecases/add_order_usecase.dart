import 'package:domain/domain.dart';

class AddOrderUseCase implements FutureUseCase<OrderModel, void> {
  final OrderRepository _orderRepository;

  AddOrderUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<void> execute(OrderModel order) async {
    await _orderRepository.addOrder(order);
  }
}
