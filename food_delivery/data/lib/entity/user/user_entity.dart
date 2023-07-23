import 'package:core/core.dart';

class UserEntity {
  final String uid;
  final String email;
  final String? userName;
  final String? imageUrl;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.userName,
    required this.imageUrl,
  });

  List<Object?> get props => [
        uid,
        email,
        userName,
        imageUrl,
      ];

  factory UserEntity.fromFirebaseAuthUser(
    User firebaseUser,
  ) {
    return UserEntity(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      userName: firebaseUser.displayName ?? '',
      imageUrl: firebaseUser.photoURL ?? '',
    );
  }

  factory UserEntity.fromGoogleAuthUser(
    UserCredential userCredential,
  ) {
    return UserEntity(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email ?? '',
      userName: userCredential.user!.displayName ?? '',
      imageUrl: userCredential.user!.photoURL ?? '',
    );
  }
}
