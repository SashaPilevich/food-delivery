import 'package:data/data.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:domain/domain.dart';

abstract class OrderWithUserInfoMapper {
  static OrderWithUserInfoEntity toEntity(OrderWithUserInfoModel model) {
    return OrderWithUserInfoEntity(
      userEntity: UserMapper.toEntity(model.userModel),
      orderEntity: OrderMapper.toEntity(model.orderModel),
    );
  }

  static OrderWithUserInfoModel toModel(OrderWithUserInfoEntity entity) {
    return OrderWithUserInfoModel(
        userModel: UserMapper.toModel(entity.userEntity),
        orderModel: OrderMapper.toModel(entity.orderEntity));
  }
}
