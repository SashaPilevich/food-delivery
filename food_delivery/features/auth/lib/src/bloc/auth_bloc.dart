import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUserUseCase _authUserUseCase;
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  AuthBloc({
    required AuthUserUseCase authUserUseCase,
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
  })  : _authUserUseCase = authUserUseCase,
        _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        super(AuthState()) {
    on<InitAuth>(_initAuth);
    on<UserNameFieldChange>(_userNameFieldChange);
    on<EmailFieldChange>(_emailFieldChange);
    on<PasswordFieldChange>(_passwordFieldChange);
    on<SignInSubmitted>(_signInSubmitted);
    on<SignUpSubmitted>(_signUpSubmitted);
    on<SignOutSubmitted>(_signOutSubmitted);
    on<SignInWithGoogleSubmitted>(_signInWithGoogle);
    on<ResetPasswordSubmitted>(_resetPassword);
  }

  Future<void> _initAuth(
    InitAuth event,
    Emitter<AuthState> emit,
  ) async {
    final Stream<UserModel> authStateChangesStream =
        _authUserUseCase.execute(const NoParams());
    await for (UserModel user in authStateChangesStream) {
      user.isEmpty
          ? emit(
              state.copyWith(
                isLogged: false,
                userModel: UserModel.empty,
              ),
            )
          : emit(
              state.copyWith(
                isLogged: true,
                userModel: user,
              ),
            );
    }
  }

  Future<void> _userNameFieldChange(
    UserNameFieldChange event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(userName: event.userName),
    );

    emit(
      state.copyWith(
        formStatus: SubmissionSuccess(),
        isSubmissionFailed: false,
      ),
    );
  }

  Future<void> _emailFieldChange(
    EmailFieldChange event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(email: event.email),
    );

    emit(
      state.copyWith(
        formStatus: SubmissionSuccess(),
        isSubmissionFailed: false,
      ),
    );
  }

  Future<void> _passwordFieldChange(
    PasswordFieldChange event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(password: event.password),
    );
    emit(
      state.copyWith(
        formStatus: SubmissionSuccess(),
        isSubmissionFailed: false,
      ),
    );
  }

  Future<void> _signInSubmitted(
    SignInSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      formStatus: FormSubmitting(),
    ));
    try {
      await _signInUseCase.execute(
        SignInParams(
          email: state.email,
          password: state.password,
        ),
      );

      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
        ),
      );

      getIt.get<AppRouter>().replace(
            const HomePageRoute(),
          );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.message),
          isSubmissionFailed: true,
        ),
      );
    }
  }

  Future<void> _signUpSubmitted(
    SignUpSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      formStatus: FormSubmitting(),
    ));
    try {
      await _signUpUseCase.execute(
        SignUpParams(
          email: state.email,
          password: state.password,
          userName: state.userName,
        ),
      );
      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
        ),
      );
      getIt.get<AppRouter>().replace(
            const HomePageRoute(),
          );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.message),
          isSubmissionFailed: true,
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
      await _signInWithGoogleUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
        ),
      );
      emit(state.copyWith(isLogged: true));
      getIt.get<AppRouter>().replace(
            const HomePageRoute(),
          );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.message),
          isSubmissionFailed: true,
        ),
      );
    }
  }

  Future<void> _resetPassword(
    ResetPasswordSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _resetPasswordUseCase.execute(state.email);
      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
        ),
      );
      emit(state.copyWith(isLogged: true));
      getIt.get<AppRouter>().replace(
            const SignInScreenRoute(),
          );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formStatus: SubmissionFailed(error.message),
          isSubmissionFailed: true,
        ),
      );
    }
  }
}
