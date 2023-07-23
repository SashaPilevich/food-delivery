import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      uid: model.uid,
      email: model.email,
      userName: model.userName,
      imageUrl: model.imageUrl,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      userName: entity.userName,
      imageUrl: entity.imageUrl,
    );
  }
}
