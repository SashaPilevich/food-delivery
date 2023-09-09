class UserModel {
  final String uid;
  final String email;
  final String userName;
  final String role;

  const UserModel({
    required this.uid,
    required this.email,
    required this.userName,
    required this.role,
  });

  List<Object?> get props => [
        uid,
        email,
        userName,
        role,
      ];

  UserModel copyWith({
    String? uid,
    String? email,
    String? userName,
    String? role,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      role: role ?? this.role,
    );
  }

  const UserModel.empty()
      : uid = '',
        email = '',
        userName = '',
        role = '';
}
