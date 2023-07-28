import 'package:core/core.dart';
import 'package:data/data.dart';

part 'auth_data_provider_impl.dart';

abstract class AuthDataProvider {
  Future<UserEntity> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  });

  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntity> signInWithGoogle();

  Future<void> signOut();

  Future<void> resetPassword({
    required String email,
  });

  Future<void> saveUser({
    required String uid,
    required String userName,
    required String email,
  });

  Future<UserEntity> getUser({
    required String uid,
  });
}
