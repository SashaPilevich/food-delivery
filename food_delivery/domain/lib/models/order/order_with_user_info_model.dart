import 'package:domain/domain.dart';

class OrderWithUserInfoModel {
  final UserModel userModel;
  final OrderModel orderModel;

  const OrderWithUserInfoModel({
    required this.userModel,
    required this.orderModel,
  });

  OrderWithUserInfoModel copyWith({
    UserModel? userModel,
    OrderModel? orderModel,
  }) {
    return OrderWithUserInfoModel(
      userModel: userModel ?? this.userModel,
      orderModel: orderModel ?? this.orderModel,
    );
  }
}
