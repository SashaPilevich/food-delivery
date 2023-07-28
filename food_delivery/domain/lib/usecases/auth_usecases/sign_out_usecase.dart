import 'package:domain/domain.dart';

class SignOutUseCase implements FutureUseCase<NoParams, void> {
  final AuthRepository _authRepository;

  SignOutUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(NoParams input) async {
    return _authRepository.signOut();
  }
}
