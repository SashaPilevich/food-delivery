import 'package:domain/domain.dart';

class AddOrderUseCase implements FutureUseCase<OrderModel, void> {
  final OrdersRepository _ordersRepository;

  AddOrderUseCase({
    required OrdersRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<void> execute(OrderModel order) async {
    await _ordersRepository.addOrder(order);
  }
}
