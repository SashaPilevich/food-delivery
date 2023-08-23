import 'package:domain/domain.dart';
import 'package:mockito/mockito.dart';
import 'package:navigation/navigation.dart';

class SignInUseCaseMock extends Mock implements SignInUseCase {
  @override
  Future<UserModel> execute(SignInParams signInParams) async {
    return const UserModel(
      uid: '1',
      email: 'email@gmail.com',
      role: 'user',
      userName: 'user',
    );
  }
}

class SignUpUseCaseMock extends Mock implements SignUpUseCase {}

class SignOutUseCaseMock extends Mock implements SignOutUseCase {}

class SignInWithGoogleUseCaseMock extends Mock
    implements SignInWithGoogleUseCase {}

class ResetPasswordUseCaseMock extends Mock implements ResetPasswordUseCase {}

class GetUserFromStorageUseCaseMock extends Mock
    implements GetUserFromStorageUseCase {}

class AppRouterMock extends Mock implements AppRouter {}
