import 'package:core/core.dart';
import 'package:data/data.dart';

class OrderEntity {
  final String id;
  final CartEntity cart;
  final DateTime dateTime;

  const OrderEntity({
    required this.id,
    required this.cart,
    required this.dateTime,
  });

  List<Object?> get props => [
        id,
        cart,
        dateTime,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cart': cart,
      'dateTime': dateTime,
    };
  }

  factory OrderEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrderEntity(
      id: json['id'] ?? '',
      cart: CartEntity.fromJson(json['cart']),
      dateTime: (json['dateTime'] as Timestamp).toDate(),
    );
  }

  factory OrderEntity.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return OrderEntity.fromJson(data);
  }
}
