class UserModel {
  final String uid;
  final String email;
  final String userName;

  const UserModel({
    required this.uid,
    required this.email,
    required this.userName,
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

  const UserModel.empty()
      : uid = '',
        email = '',
        userName = '';
}
