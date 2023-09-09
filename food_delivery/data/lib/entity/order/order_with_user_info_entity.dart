import 'package:core/core.dart';
import 'package:data/data.dart';

class OrderWithUserInfoEntity {
  final UserEntity userEntity;
  final OrderEntity orderEntity;

  const OrderWithUserInfoEntity({
    required this.userEntity,
    required this.orderEntity,
  });

  List<Object?> get props => [
        userEntity,
        orderEntity,
      ];

  Map<String, dynamic> toJson() {
    return {
      'userEntity': userEntity,
      'orderEntity': orderEntity,
    };
  }

  factory OrderWithUserInfoEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrderWithUserInfoEntity(
      userEntity: UserEntity.fromJson(json['user']),
      orderEntity: OrderEntity.fromJson(json['order']),
    );
  }

  factory OrderWithUserInfoEntity.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return OrderWithUserInfoEntity.fromJson(data);
  }
}
