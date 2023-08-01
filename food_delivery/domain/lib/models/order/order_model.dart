import 'package:domain/domain.dart';

class OrderModel {
  final String id;
  final CartModel cart;
  final DateTime dateTime;

  const OrderModel({
    required this.id,
    required this.cart,
    required this.dateTime,
  });

  OrderModel copyWith({
    String? id,
    CartModel? cart,
    DateTime? dateTime,
  }) {
    return OrderModel(
      id: id ?? this.id,
      cart: cart ?? this.cart,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
