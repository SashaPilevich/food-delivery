import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataProvider _authDataProvider;

  const AuthRepositoryImpl({
    required AuthDataProvider authDataProvider,
  }) : _authDataProvider = authDataProvider;

  @override
  Stream<UserModel> get user {
    return _authDataProvider.user.map((UserEntity? userEntity) {
      return userEntity == null
          ? UserModel.empty
          : UserMapper.toModel(userEntity);
    });
  }

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
    
    return UserMapper.toModel(userEntity);
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

    return UserMapper.toModel(userEntity);
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final UserEntity authModel = await _authDataProvider.signInWithGoogle();
  
    return UserMapper.toModel(authModel);
  }

  @override
  Future<void> signOut() async {
    await _authDataProvider.signOut();
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    await _authDataProvider.resetPassword(email: email);
  }
}
