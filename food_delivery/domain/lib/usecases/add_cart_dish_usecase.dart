import 'package:domain/domain.dart';

class AddCartDishUseCase implements FutureUseCase<DishModel, void> {
  final CartRepository _cartRepository;

  AddCartDishUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(DishModel dish) async {
    return _cartRepository.addDishToCart(dish);
  }
}
