import 'package:core/core.dart';

class UserEntity {
  final String uid;
  final String email;
  final String? userName;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.userName,
  });

  List<Object?> get props => [
        uid,
        email,
        userName,
      ];

  factory UserEntity.fromFirebaseAuthUser(
    User firebaseUser,
  ) {
    return UserEntity(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      userName: firebaseUser.displayName ?? '',
    );
  }

  factory UserEntity.fromGoogleAuthUser(
    UserCredential userCredential,
  ) {
    return UserEntity(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email ?? '',
      userName: userCredential.user!.displayName ?? '',
    );
  }

  static const UserEntity empty = UserEntity(
    uid: '',
    email: '',
    userName: '',
  );

  bool get isEmpty => this == UserEntity.empty;
}
