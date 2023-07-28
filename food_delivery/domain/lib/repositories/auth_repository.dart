import 'package:domain/domain.dart';

abstract class AuthRepository {
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

  Future<UserModel> getUserFromStorage();
}
