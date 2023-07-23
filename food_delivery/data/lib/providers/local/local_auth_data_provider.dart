import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

part 'local_auth_data_provider_impl.dart';

abstract class LocalAuthDataProvider {
  Future<void> saveUserToLocal(UserModel userModel);
  Future<UserEntity> getUserFromLocal();
  Future<void> deleteUserFromLocal();
}
