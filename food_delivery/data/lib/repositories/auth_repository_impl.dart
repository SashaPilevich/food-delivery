import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataProvider _authDataProvider;
  final LocalAuthDataProvider _localAuthDataProvider;

  const AuthRepositoryImpl({
    required AuthDataProvider authDataProvider,
    required LocalAuthDataProvider localAuthDataProvider,
  })  : _localAuthDataProvider = localAuthDataProvider,
        _authDataProvider = authDataProvider;

  @override
  Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
        await _authDataProvider.signUpWithEmailAndPassword(
      userName: userName,
      email: email,
      password: password,
    );
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _localAuthDataProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
        await _authDataProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _localAuthDataProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final UserEntity userEntity = await _authDataProvider.signInWithGoogle();
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _localAuthDataProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<void> signOut() async {
    await _authDataProvider.signOut();
    await _localAuthDataProvider.deleteUserFromLocal();
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    await _authDataProvider.resetPassword(email: email);
  }

  @override
  Future<UserModel> getUserFromStorage() async {
    final UserEntity userEntity =
        await _localAuthDataProvider.getUserFromLocal();
    return UserMapper.toModel(userEntity);
  }
}
