import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(CartState.empty(
          const CartModel(
            dishes: [],
            totalPrice: 0,
          ),
        )) {
    on<AddDishToCart>(_addDishToCart);
    on<RemoveDishFromCart>(_removeDishFromCart);
  }

  Future<void> _addDishToCart(
    AddDishToCart event,
    Emitter<CartState> emit,
  ) async {
    final List<CartDish> updatedCartItems = List.from(state.cart.dishes);
    bool isDishExists = false;

    for (int i = 0; i < updatedCartItems.length; i++) {
      final CartDish cartDish = updatedCartItems[i];
      if (cartDish.dish == event.dish) {
        cartDish.quantity = cartDish.quantity + 1;
        isDishExists = true;
      }
    }
    if (!isDishExists) {
      updatedCartItems.add(
        CartDish(dish: event.dish, quantity: 1),
      );
    }

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
    final List<CartDish> updatedCartItems = List.from(state.cart.dishes);

    for (int i = 0; i < updatedCartItems.length; i++) {
      final CartDish cartDish = updatedCartItems[i];
      if (cartDish.dish == event.dish && cartDish.quantity > 1) {
        cartDish.quantity = cartDish.quantity - 1;
      } else if (cartDish.dish == event.dish && cartDish.quantity == 1) {
        updatedCartItems.removeAt(i);
      }
    }
    emit(
      state.copyWith(
        cart: CartModel(
          dishes: updatedCartItems,
          totalPrice: state.cart.totalPrice - event.dish.cost,
        ),
      ),
    );
  }
}
