part of 'auth_bloc.dart';

class AuthState {
  final bool isLogged;
  final FormSubmissionStatus formStatus;
  final UserModel userModel;
  final bool isSignInPage;
  final bool isResetPasswordPage;

  AuthState({
    required this.isLogged,
    required this.formStatus,
    required this.userModel,
    required this.isSignInPage,
    required this.isResetPasswordPage,
  });
  AuthState.empty()
      : isLogged = false,
        formStatus = const InitialFormStatus(),
        userModel = const UserModel.empty(),
        isSignInPage = true,
        isResetPasswordPage = false;

  AuthState copyWith({
    bool? isLogged,
    FormSubmissionStatus? formStatus,
    UserModel? userModel,
    bool? isSignInPage,
    bool? isResetPasswordPage,
  }) {
    return AuthState(
      isLogged: isLogged ?? this.isLogged,
      formStatus: formStatus ?? this.formStatus,
      userModel: userModel ?? this.userModel,
      isSignInPage: isSignInPage ?? this.isSignInPage,
      isResetPasswordPage: isResetPasswordPage ?? this.isResetPasswordPage,
    );
  }
}
