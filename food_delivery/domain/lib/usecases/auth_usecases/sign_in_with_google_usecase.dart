import 'package:domain/domain.dart';

class SignInWithGoogleUseCase implements FutureUseCase<NoParams, UserModel> {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _authRepository.signInWithGoogle();
  }
}
