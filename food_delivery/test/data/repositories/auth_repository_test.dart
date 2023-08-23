import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

const UserModel userModel = UserModel(
  uid: '1',
  email: 'sasha@gmail.com',
  userName: 'sasha',
  role: 'user',
);

final UserEntity userEntity = UserMapper.toEntity(userModel);
void main() {
  late FirebaseAuthProviderMock firebaseAuthProviderMock;
  late HiveProviderMock hiveProviderMock;
  late AuthRepository authRepository;
  late MockUserModel mockUserModel;
  setUp(() {
    mockUserModel = MockUserModel();
    firebaseAuthProviderMock = FirebaseAuthProviderMock();
    hiveProviderMock = HiveProviderMock();
    authRepository = AuthRepositoryImpl(
      firebaseAuthProvider: firebaseAuthProviderMock,
      hiveProvider: hiveProviderMock,
    );
    registerFallbackValue(mockUserModel);
  });

  test('when sign up is calling should be return user model', () async {
    when(
      () => firebaseAuthProviderMock.signUpWithEmailAndPassword(
        userName: 'sasha',
        email: 'sasha@gmail.com',
        password: '123456',
      ),
    ).thenAnswer((_) async => userEntity);

    when(
      () => hiveProviderMock.saveUserToLocal(any()),
    ).thenAnswer((_) async => Future.value());

    expect(
        await authRepository.signUp(
          userName: 'sasha',
          email: 'sasha@gmail.com',
          password: '123456',
        ),
        isA<UserModel>());
  });
  test('when sign in is calling should be return user model', () async {
    when(
      () => firebaseAuthProviderMock.signInWithEmailAndPassword(
        email: 'sasha@gmail.com',
        password: '123456',
      ),
    ).thenAnswer((_) async => userEntity);

    when(
      () => hiveProviderMock.saveUserToLocal(any()),
    ).thenAnswer((_) async => Future.value());

    expect(
        await authRepository.signIn(
          email: 'sasha@gmail.com',
          password: '123456',
        ),
        isA<UserModel>());
  });

  test('when sign in with Google is calling should be return user model',
      () async {
    when(
      () => firebaseAuthProviderMock.signInWithGoogle(),
    ).thenAnswer((_) async => userEntity);

    when(
      () => hiveProviderMock.saveUserToLocal(any()),
    ).thenAnswer((_) async => Future.value());

    expect(
      await authRepository.signInWithGoogle(),
      isA<UserModel>(),
    );
  });

  test('sign out should be called once', () async {
    when(() => firebaseAuthProviderMock.signOut())
        .thenAnswer((_) => Future.value());
    when(() => hiveProviderMock.deleteUserFromLocal())
        .thenAnswer((_) => Future.value());
    await authRepository.signOut();
    verify(() => firebaseAuthProviderMock.signOut()).called(1);
    verify(() => hiveProviderMock.deleteUserFromLocal()).called(1);
  });

  test('reset password should be called once', () async {
    when(
      () => firebaseAuthProviderMock.resetPassword(
        email: 'sasha@gmail.com',
      ),
    ).thenAnswer((_) => Future.value());
    await authRepository.resetPassword(email: 'sasha@gmail.com');
    verify(
      () => firebaseAuthProviderMock.resetPassword(
        email: 'sasha@gmail.com',
      ),
    ).called(1);
  });
}
