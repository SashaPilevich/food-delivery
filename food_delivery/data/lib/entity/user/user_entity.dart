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

  static const UserEntity empty = UserEntity(
    uid: '',
    email: '',
    userName: '',
  );

  bool get isEmpty => this == UserEntity.empty;
}
