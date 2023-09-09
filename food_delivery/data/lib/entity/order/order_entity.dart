import 'package:core/core.dart';
import 'package:data/data.dart';

class OrderEntity {
  final String id;
  final CartEntity cart;
  final DateTime dateTime;
  final bool isComplete;

  const OrderEntity({
    required this.id,
    required this.cart,
    required this.dateTime,
    required this.isComplete,
  });

  List<Object?> get props => [
        id,
        cart,
        dateTime,
        isComplete,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cart': cart,
      'dateTime': dateTime,
      'isComplete': isComplete,
    };
  }

  factory OrderEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrderEntity(
      id: json['id'] ?? '',
      cart: CartEntity.fromJson(json['cart']),
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      isComplete: json['isComplete'] ?? false,
    );
  }

  factory OrderEntity.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return OrderEntity.fromJson(data);
  }
}
