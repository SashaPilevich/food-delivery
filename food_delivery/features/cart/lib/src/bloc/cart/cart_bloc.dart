import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddDishToCart>(_addDishToCart);
    on<RemoveDishFromCart>(_removeDishFromCart);
  }

  Future<void> _addDishToCart(
      AddDishToCart event, Emitter<CartState> emit) async {
    final Map<DishModel, int> updatedCartItems = Map.from(state.cart.cartItems);

    if (updatedCartItems.containsKey(event.dish)) {
      updatedCartItems[event.dish] = updatedCartItems[event.dish]! + 1;
    } else {
      updatedCartItems[event.dish] = 1;
    }

    emit(
      state.copyWith(
        cart: CartModel(
          cartItems: updatedCartItems,
          totalPrice: state.cart.totalPrice + event.dish.cost,
        ),
      ),
    );
  }

  Future<void> _removeDishFromCart(
      RemoveDishFromCart event, Emitter<CartState> emit) async {
    final Map<DishModel, int> updatedCartItems = Map.from(state.cart.cartItems);

    if (updatedCartItems[event.dish]! > 1) {
      updatedCartItems[event.dish] = updatedCartItems[event.dish]! - 1;
    } else {
      updatedCartItems.remove(event.dish);
    }

    emit(
      state.copyWith(
        cart: CartModel(
          cartItems: updatedCartItems,
          totalPrice: state.cart.totalPrice - event.dish.cost,
        ),
      ),
    );
  }
}
