import 'package:domain/domain.dart';

class CartDish {
  final DishModel dish;
  int quantity;

  CartDish({
    required this.dish,
    required this.quantity,
  });

  CartDish copyWith({
    DishModel? dish,
    int? quantity,
  }) {
    return CartDish(
      dish: dish ?? this.dish,
      quantity: quantity ?? this.quantity,
    );
  }

  List<Object?> get props => [
        dish,
        quantity,
      ];
}
