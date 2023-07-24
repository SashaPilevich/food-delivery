part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class InitAuth extends AuthEvent {
  InitAuth();
}

class SignInSubmitted extends AuthEvent {
  SignInSubmitted();
}

class SignInWithGoogleSubmitted extends AuthEvent {
  SignInWithGoogleSubmitted();
}

class SignUpSubmitted extends AuthEvent {
  SignUpSubmitted();
}

class SignOutSubmitted extends AuthEvent {
  SignOutSubmitted();
}

class ResetPasswordSubmitted extends AuthEvent {
  ResetPasswordSubmitted();
}

class UserNameFieldChange extends AuthEvent {
  final String userName;

  UserNameFieldChange({
    required this.userName,
  });
}

class EmailFieldChange extends AuthEvent {
  final String email;

  EmailFieldChange({
    required this.email,
  });
}

class PasswordFieldChange extends AuthEvent {
  final String password;

  PasswordFieldChange({
    required this.password,
  });
}

class NavigateToHomePage extends AuthEvent {
  final BuildContext context;
  NavigateToHomePage({
    required this.context,
  });
}

class NavigateToSignInScreen extends AuthEvent {
  final BuildContext context;
  NavigateToSignInScreen({
    required this.context,
  });
}
