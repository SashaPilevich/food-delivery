import 'package:domain/domain.dart';

class OrderModel {
  final String id;
  final CartModel cart;
  final DateTime dateTime;
  final bool isComplete;

  const OrderModel({
    required this.id,
    required this.cart,
    required this.dateTime,
    required this.isComplete,
  });

  OrderModel copyWith({
    String? id,
    CartModel? cart,
    DateTime? dateTime,
    bool? isComplete,
  }) {
    return OrderModel(
      id: id ?? this.id,
      cart: cart ?? this.cart,
      dateTime: dateTime ?? this.dateTime,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
