part of 'auth_bloc.dart';

class AuthState {
  final bool isLogged;
  final FormSubmissionStatus formStatus;
  final UserModel userModel;

  AuthState({
    this.isLogged = false,
    this.formStatus = const InitialFormStatus(),
    this.userModel = UserModel.empty,
  });

  AuthState copyWith({
    bool? isLogged,
    FormSubmissionStatus? formStatus,
    UserModel? userModel,
  }) {
    return AuthState(
      isLogged: isLogged ?? this.isLogged,
      formStatus: formStatus ?? this.formStatus,
      userModel: userModel ?? this.userModel,
    );
  }
}
