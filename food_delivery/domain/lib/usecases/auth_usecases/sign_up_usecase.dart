import 'package:domain/domain.dart';

class SignUpUseCase implements FutureUseCase<SignUpParams, UserModel> {
  final AuthRepository _authRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel> execute(SignUpParams params) async {
    return _authRepository.signUp(
      userName: params.userName,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String userName;
  final String email;
  final String password;

  SignUpParams({
    required this.userName,
    required this.email,
    required this.password,
  });
}
