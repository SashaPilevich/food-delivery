part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class InitAuth extends AuthEvent {
  InitAuth();
}

class SignInSubmitted extends AuthEvent {
  final String email;
  final String password;

  SignInSubmitted({
    required this.email,
    required this.password,
  });
}

class SignInWithGoogleSubmitted extends AuthEvent {
  SignInWithGoogleSubmitted();
}

class SignUpSubmitted extends AuthEvent {
  final String userName;
  final String email;
  final String password;

  SignUpSubmitted({
    required this.userName,
    required this.email,
    required this.password,
  });
}

class SignOutSubmitted extends AuthEvent {
  SignOutSubmitted();
}

class ResetPasswordSubmitted extends AuthEvent {
  final String email;

  ResetPasswordSubmitted({
    required this.email,
  });
}

class NavigateToHomePage extends AuthEvent {
  NavigateToHomePage();
}

class NavigateToSignInScreen extends AuthEvent {
  NavigateToSignInScreen();
}
