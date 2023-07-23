class UserModel {
  final String uid;
  final String email;
  final String? userName;

  const UserModel({
    required this.uid,
    required this.email,
    this.userName,
  });

  List<Object?> get props => [
        uid,
        email,
        userName,
      ];

  UserModel copyWith({
    String? uid,
    String? email,
    String? userName,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      userName: userName ?? this.userName,
    );
  }

  static const UserModel empty = UserModel(
    uid: '',
    email: '',
    userName: '',
  );

  bool get isEmpty => this == UserModel.empty;
}
