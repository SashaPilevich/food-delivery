import 'package:domain/domain.dart';

class AddCartDishUseCase implements FutureUseCase<AddToCartParams, void> {
  final CartRepository _cartRepository;

  AddCartDishUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(AddToCartParams addToCartParams) async {
    return _cartRepository.addDishToCart(
      dish: addToCartParams.dish,
      userId: addToCartParams.userId,
    );
  }
}

class AddToCartParams {
  final DishModel dish;
  final String userId;

  const AddToCartParams({
    required this.dish,
    required this.userId,
  });
}
