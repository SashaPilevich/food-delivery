import 'package:data/data.dart';

abstract class FirebaseAuthProvider {
  Future<UserEntity> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  });
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<UserEntity> signInWithGoogle();
  Future<void> resetPassword({
    required String email,
  });
}
