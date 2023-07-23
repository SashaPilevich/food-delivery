part of 'auth_bloc.dart';

class AuthState {
  final bool isLogged;
  final String userName;
  final String email;
  final String password;
  final bool isSubmissionFailed;
  final FormSubmissionStatus formStatus;
  final UserModel userModel;

  AuthState({
    this.isLogged = false,
    this.userName='',
    this.email = '',
    this.password = '',
    this.isSubmissionFailed = false,
    this.formStatus = const InitialFormStatus(),
    this.userModel = UserModel.empty,
  });

  AuthState copyWith({
    bool? isLogged,
    String? userName,
    String? email,
    String? password,
    bool? isSubmissionFailed,
    FormSubmissionStatus? formStatus,
    UserModel? userModel,
  }) {
    return AuthState(
        isLogged: isLogged ?? this.isLogged,
        userName: userName??this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        isSubmissionFailed: isSubmissionFailed ?? this.isSubmissionFailed,
        formStatus: formStatus ?? this.formStatus,
        userModel: userModel ?? this.userModel);
  }
}
