import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddCartDishUseCase _addCartDishUseCase;
  final RemoveCartDishUseCase _removeCartDishUseCase;
  final GetCartDishesUseCase _getCartDishesUseCase;
  final ClearCartUseCase _clearCartUseCase;
  final GetUserFromStorageUseCase _getUserFromStorageUseCase;
  final AppRouter _appRouter;
  CartBloc({
    required AddCartDishUseCase addCartDishUseCase,
    required RemoveCartDishUseCase removeCartDishUseCase,
    required GetCartDishesUseCase getCartDishesUseCase,
    required ClearCartUseCase clearCartUseCase,
    required GetUserFromStorageUseCase getUserFromStorageUseCase,
    required AppRouter appRouter,
  })  : _addCartDishUseCase = addCartDishUseCase,
        _removeCartDishUseCase = removeCartDishUseCase,
        _getCartDishesUseCase = getCartDishesUseCase,
        _clearCartUseCase = clearCartUseCase,
        _getUserFromStorageUseCase = getUserFromStorageUseCase,
        _appRouter = appRouter,
        super(CartState.empty()) {
    on<InitCart>(_initCart);
    on<AddDishToCart>(_addDishToCart);
    on<RemoveDishFromCart>(_removeDishFromCart);
    on<ClearCart>(_clearCart);
    on<NavigateToSelectedDishScreen>(_navigateToSelectedDishScreen);
    on<NavigateToCurrentScreen>(_navigateToCurrentScreen);

    add(InitCart());
  }

  Future<void> _initCart(
    InitCart event,
    Emitter<CartState> emit,
  ) async {
    final List<CartDish> dishesInCart = await _getCartDishesUseCase.execute(
      const NoParams(),
    );
    final UserModel userFromStorage = await _getUserFromStorageUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        userUid: userFromStorage.uid,
      ),
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
          cart: state.cart.copyWith(
            dishes: dishesInCart,
            totalPrice: totalPrice,
          ),
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

  Future<void> _clearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    await _clearCartUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        cart: const CartModel(
          dishes: [],
          totalPrice: 0,
        ),
      ),
    );
  }

  void _navigateToSelectedDishScreen(
    NavigateToSelectedDishScreen event,
    Emitter<CartState> emit,
  ) {
    _appRouter.navigate(
      SelectDishScreenRoute(
        dish: event.dishModel,
      ),
    );
  }

  void _navigateToCurrentScreen(
    NavigateToCurrentScreen event,
    Emitter<CartState> emit,
  ) {
    _appRouter.pop();
  }
}
