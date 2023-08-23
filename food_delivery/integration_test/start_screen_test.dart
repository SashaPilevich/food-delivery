import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:navigation/navigation.dart';

import 'mocks.dart';

const UserModel userModel = UserModel(
  uid: '1',
  email: 'email@gmail.com',
  role: 'user',
  userName: 'user',
);
void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late AuthBloc authBloc;
  late SignInUseCase signInUseCase;
  late SignUpUseCase signUpUseCase;
  late SignOutUseCase signOutUseCase;
  late SignInWithGoogleUseCase signInWithGoogleUseCase;
  late ResetPasswordUseCase resetPasswordUseCase;
  late GetUserFromStorageUseCase getUserFromStorageUseCase;
  late AppRouter appRouter;

  setUp(() {
    signInUseCase = SignInUseCaseMock();
    signUpUseCase = SignUpUseCaseMock();
    signOutUseCase = SignOutUseCaseMock();
    signInWithGoogleUseCase = SignInWithGoogleUseCaseMock();
    resetPasswordUseCase = ResetPasswordUseCaseMock();
    getUserFromStorageUseCase = GetUserFromStorageUseCaseMock();
    appRouter = AppRouterMock();
    authBloc = AuthBloc(
      signInUseCase: signInUseCase,
      signUpUseCase: signUpUseCase,
      signOutUseCase: signOutUseCase,
      signInWithGoogleUseCase: signInWithGoogleUseCase,
      resetPasswordUseCase: resetPasswordUseCase,
      getUserFromStorageUseCase: getUserFromStorageUseCase,
      appRouter: appRouter,
    );
  });
  group('Auth screen test', () {
    testWidgets('verify start screen with loading indicator',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (_) => authBloc,
          child: const MaterialApp(
            home: StartScreen(),
          ),
        ),
      );

      expect(find.byType(LoadingIndicator), findsOneWidget);
    });

    testWidgets('verify sign in screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (_) => authBloc,
          child: const MaterialApp(
            home: SignInScreen(),
          ),
        ),
      );

      expect(find.byType(SignInScreen), findsOneWidget);

      await tester.enterText(
          find.byType(TextFormField).at(0), 'email@gmail.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password');
      await tester.tap(find.byType(ButtonSubmit));
      await tester.pump();
    });

    testWidgets('verify sign up screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (_) => authBloc,
          child: const MaterialApp(
            home: SignInScreen(),
          ),
        ),
      );

      expect(find.byType(SignInScreen), findsOneWidget);
      await tester.tap(find.byType(SignInSignUpSwitch));
      await tester.enterText(find.byType(TextFormField).at(0), 'sasha');
      await tester.enterText(
          find.byType(TextFormField).at(1), 'email@gmail.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.tap(find.byType(ButtonSubmit));
      await tester.pump();
    });
  });
}
