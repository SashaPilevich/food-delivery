import 'package:domain/domain.dart';

class ResetPasswordUseCase implements FutureUseCase<String, void> {
  final AuthRepository _authRepository;

  ResetPasswordUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(String email) async {
    return _authRepository.resetPassword(email: email);
  }
}
