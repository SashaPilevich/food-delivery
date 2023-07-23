class UserModel {
  final String uid;
  final String email;
  final String? userName;
  final String? imageUrl;

  const UserModel({
    required this.uid,
    required this.email,
    this.userName,
    this.imageUrl,
  });

  List<Object?> get props => [
        uid,
        email,
        userName,
        imageUrl,
      ];

  UserModel copyWith({
    String? uid,
    String? email,
    String? userName,
    String? imageUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  static const UserModel empty = UserModel(
    uid: '',
    email: '',
    userName: '',
    imageUrl: '',
  );

  bool get isEmpty => this == UserModel.empty;
}
