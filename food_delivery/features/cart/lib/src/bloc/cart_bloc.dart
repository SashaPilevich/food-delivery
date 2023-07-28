import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddCartDishUseCase _addCartDishUseCase;
  final RemoveCartDishUseCase _removeCartDishUseCase;
  final GetCartDishesUseCase _getCartDishesUseCase;
  CartBloc({
    required AddCartDishUseCase addCartDishUseCase,
    required RemoveCartDishUseCase removeCartDishUseCase,
    required GetCartDishesUseCase getCartDishesUseCase,
  })  : _addCartDishUseCase = addCartDishUseCase,
        _removeCartDishUseCase = removeCartDishUseCase,
        _getCartDishesUseCase = getCartDishesUseCase,
        super(CartState.empty()) {
    on<InitCart>(_initCart);
    on<AddDishToCart>(_addDishToCart);
    on<RemoveDishFromCart>(_removeDishFromCart);

    add(InitCart());
  }

  Future<void> _initCart(
    InitCart event,
    Emitter<CartState> emit,
  ) async {
    final List<CartDish> dishesInCart = await _getCartDishesUseCase.execute(
      const NoParams(),
    );
    if (dishesInCart.isEmpty) {
      emit(state.copyWith(cart: state.cart));
    } else {
      int totalPrice = 0;
      for (final item in dishesInCart) {
        totalPrice += item.dish.cost * item.quantity;
      }
      emit(
        state.copyWith(
          cart:
              state.cart.copyWith(dishes: dishesInCart, totalPrice: totalPrice),
        ),
      );
    }
  }

  Future<void> _addDishToCart(
    AddDishToCart event,
    Emitter<CartState> emit,
  ) async {
    await _addCartDishUseCase.execute(event.dish);
    final List<CartDish> updatedCartItems = await _getCartDishesUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        cart: CartModel(
          dishes: updatedCartItems,
          totalPrice: state.cart.totalPrice + event.dish.cost,
        ),
      ),
    );
  }

  Future<void> _removeDishFromCart(
    RemoveDishFromCart event,
    Emitter<CartState> emit,
  ) async {
    await _removeCartDishUseCase.execute(event.cartDish);
    final List<CartDish> updatedCartItems = await _getCartDishesUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        cart: CartModel(
          dishes: updatedCartItems,
          totalPrice: state.cart.totalPrice - event.cartDish.dish.cost,
        ),
      ),
    );
  }
}
