import 'package:domain/domain.dart';

class SignInUseCase implements FutureUseCase<SignInParams, UserModel> {
  final AuthRepository _authRepository;

  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel> execute(SignInParams params) async {
    return _authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
