import 'package:domain/domain.dart';

class ClearCartUseCase implements FutureUseCase<String, void> {
  final CartRepository _cartRepository;

  ClearCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(String userId) async {
    await _cartRepository.clearCart(
      userId: userId,
    );
  }
}
