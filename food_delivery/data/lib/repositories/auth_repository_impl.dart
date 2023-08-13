import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthProvider _firebaseAuthProvider;
  final HiveProvider _hiveProvider;

  const AuthRepositoryImpl({
    required FirebaseAuthProvider firebaseAuthProvider,
    required HiveProvider hiveProvider,
  })  : _hiveProvider = hiveProvider,
        _firebaseAuthProvider = firebaseAuthProvider;

  @override
  Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
        await _firebaseAuthProvider.signUpWithEmailAndPassword(
      userName: userName,
      email: email,
      password: password,
    );
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _hiveProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
        await _firebaseAuthProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _hiveProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final UserEntity userEntity =
        await _firebaseAuthProvider.signInWithGoogle();
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _hiveProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthProvider.signOut();
    await _hiveProvider.deleteUserFromLocal();
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    await _firebaseAuthProvider.resetPassword(email: email);
  }

  @override
  Future<UserModel> getUserFromStorage() async {
    final UserEntity userEntity = await _hiveProvider.getUserFromLocal();
    return UserMapper.toModel(userEntity);
  }
}
