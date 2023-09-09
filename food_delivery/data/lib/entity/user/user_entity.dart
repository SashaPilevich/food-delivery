import 'package:core/core.dart';

class UserEntity {
  final String uid;
  final String email;
  final String userName;
  final String role;

  const UserEntity({
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

  const UserEntity.empty()
      : uid = '',
        email = '',
        userName = '',
        role = '';

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': userName,
      'role': role,
    };
  }

  factory UserEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserEntity(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      userName: json['name'] ?? '',
      role: json['role'] ?? '',
    );
  }

  factory UserEntity.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return UserEntity.fromJson(data);
  }
}
