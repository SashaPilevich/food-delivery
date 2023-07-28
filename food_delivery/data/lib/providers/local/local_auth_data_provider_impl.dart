part of 'local_auth_data_provider.dart';

class LocalAuthDataProviderImpl implements LocalAuthDataProvider {
  LocalAuthDataProviderImpl();

  @override
  Future<void> saveUserToLocal(UserModel userModel) async {
    final Box<UserEntity> userBox = await Hive.openBox('user');
    final UserEntity userEntity = UserMapper.toEntity(userModel);
    await userBox.add(userEntity);
  }

  @override
  Future<UserEntity> getUserFromLocal() async {
    final Box<UserEntity> userBox = await Hive.openBox('user');

    return userBox.isNotEmpty ? userBox.values.first : const UserEntity.empty();
  }

  @override
  Future<void> deleteUserFromLocal() async {
    final Box<UserEntity> userBox = await Hive.openBox('user');
    await userBox.clear();
  }
}
