import 'package:domain/domain.dart';

class GetCartDishesUseCase implements FutureUseCase<String, List<CartDish>> {
  final CartRepository _cartRepository;

  GetCartDishesUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<List<CartDish>> execute(String userId) async {
    return _cartRepository.getDishesFromCart(
      userId: userId,
    );
  }
}
