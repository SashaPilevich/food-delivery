part of 'auth_bloc.dart';

class AuthState {
  final bool isLogged;
  final FormSubmissionStatus formStatus;
  final UserModel userModel;

  AuthState({
    required this.isLogged,
    required this.formStatus,
    required this.userModel,
  });
  AuthState.empty()
      : isLogged = false,
        formStatus = const InitialFormStatus(),
        userModel = const UserModel.empty();

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
