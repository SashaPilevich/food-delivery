import 'package:domain/domain.dart';

class RemoveCartDishUseCase
    implements FutureUseCase<RemoveCartDishParams, void> {
  final CartRepository _cartRepository;

  RemoveCartDishUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(RemoveCartDishParams removeCartDishParams) async {
    return _cartRepository.removeDishFromCart(
      cartDish: removeCartDishParams.cartDish,
      userId: removeCartDishParams.userId,
    );
  }
}

class RemoveCartDishParams {
  final CartDish cartDish;
  final String userId;

  const RemoveCartDishParams({
    required this.cartDish,
    required this.userId,
  });
}
