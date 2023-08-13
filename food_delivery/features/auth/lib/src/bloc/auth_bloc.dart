import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final GetUserFromStorageUseCase _getUserFromStorageUseCase;
  final AppRouter _appRouter;

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
    required GetUserFromStorageUseCase getUserFromStorageUseCase,
    required AppRouter appRouter,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _getUserFromStorageUseCase = getUserFromStorageUseCase,
        _appRouter = appRouter,
        super(
          AuthState.empty(),
        ) {
    on<InitAuth>(_initAuth);
    on<SignInSubmitted>(_signInSubmitted);
    on<SignUpSubmitted>(_signUpSubmitted);
    on<SignOutSubmitted>(_signOutSubmitted);
    on<SignInWithGoogleSubmitted>(_signInWithGoogle);
    on<ResetPasswordSubmitted>(_resetPassword);
    on<NavigateToHomePage>(_navigateToHomePage);
    on<NavigateToSignInScreen>(_navigateToSignInScreen);
    on<ChangeSignPage>(_changeSignPage);
    on<ChangeResetPasswordPage>(_changeResetPasswordPage);
  }

  Future<void> _initAuth(
    InitAuth event,
    Emitter<AuthState> emit,
  ) async {
    final UserModel userFromStorage = await _getUserFromStorageUseCase.execute(
      const NoParams(),
    );
    userFromStorage.uid == ''
        ? emit(
            state.copyWith(
              isLogged: false,
              userModel: const UserModel.empty(),
            ),
          )
        : emit(
            state.copyWith(
              isLogged: true,
              userModel: userFromStorage,
            ),
          );
  }

  Future<void> _signInSubmitted(
    SignInSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormSubmitting(),
      ),
    );
    try {
      final UserModel userModel = await _signInUseCase.execute(
        SignInParams(
          email: event.email,
          password: event.password,
        ),
      );

      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
          userModel: userModel,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.message),
        ),
      );
    }
  }

  Future<void> _signUpSubmitted(
    SignUpSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormSubmitting(),
      ),
    );
    try {
      final UserModel userModel = await _signUpUseCase.execute(
        SignUpParams(
          email: event.email,
          password: event.password,
          userName: event.userName,
        ),
      );
      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
          userModel: userModel,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.message),
        ),
      );
    }
  }

  Future<void> _signOutSubmitted(
    SignOutSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    await _signOutUseCase.execute(
      const NoParams(),
    );
    emit(state.copyWith(isLogged: false));
  }

  Future<void> _signInWithGoogle(
    SignInWithGoogleSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final UserModel user = await _signInWithGoogleUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          userModel: user,
        ),
      );
      _appRouter.replace(
        const HomePageRoute(),
      );
    } catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.toString()),
        ),
      );
    }
  }

  Future<void> _resetPassword(
    ResetPasswordSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _resetPasswordUseCase.execute(event.email);
      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.message),
        ),
      );
    }
  }

  void _navigateToHomePage(
    NavigateToHomePage event,
    Emitter<AuthState> emit,
  ) {
    _appRouter.replace(const HomePageRoute());
  }

  void _navigateToSignInScreen(
    NavigateToSignInScreen event,
    Emitter<AuthState> emit,
  ) {
    _appRouter.replace(const SignInScreenRoute());
  }

  void _changeSignPage(
    ChangeSignPage event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        isSignInPage: !state.isSignInPage,
      ),
    );
  }

  void _changeResetPasswordPage(
    ChangeResetPasswordPage event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        isResetPasswordPage: !state.isResetPasswordPage,
      ),
    );
  }
}
