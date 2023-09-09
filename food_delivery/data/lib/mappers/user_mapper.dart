import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      uid: model.uid,
      email: model.email,
      userName: model.userName,
      role: model.role,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      userName: entity.userName,
      role: entity.role,
    );
  }
}
