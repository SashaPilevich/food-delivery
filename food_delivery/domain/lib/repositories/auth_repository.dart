import 'package:domain/domain.dart';

abstract class AuthRepository {
  Stream<UserModel> get user;

  Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
  });

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithGoogle();

  Future<void> signOut();

  Future<void> resetPassword({
    required String email,
  });
}
