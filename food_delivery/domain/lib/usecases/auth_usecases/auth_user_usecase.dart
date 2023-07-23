import 'package:domain/domain.dart';

class AuthUserUseCase implements StreamUseCase<NoParams, UserModel> {
  final AuthRepository _authRepository;

  AuthUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Stream<UserModel> execute(NoParams input) {
    return _authRepository.user;
  }
}
