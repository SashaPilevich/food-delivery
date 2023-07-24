import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
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

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
    required GetUserFromStorageUseCase getUserFromStorageUseCase,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _getUserFromStorageUseCase = getUserFromStorageUseCase,
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
    on<NavigateToHomePage>(_navigateToHomePage);
    on<NavigateToSignInScreen>(_navigateToSignInScreen);
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
              userModel: UserModel.empty,
            ),
          )
        : emit(
            state.copyWith(
              isLogged: true,
              userModel: userFromStorage,
            ),
          );
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
      final UserModel userModel = await _signInUseCase.execute(
        SignInParams(
          email: state.email,
          password: state.password,
        ),
      );

      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
          userModel: userModel,
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
      final UserModel userModel = await _signUpUseCase.execute(
        SignUpParams(
          email: state.email,
          password: state.password,
          userName: state.userName,
        ),
      );
      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
          userModel: userModel,
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
      final user = await _signInWithGoogleUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          formStatus: SubmissionSuccess(),
        ),
      );
      emit(state.copyWith(isLogged: true, userModel: user));
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
            SignInScreenRoute(),
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

  void _navigateToHomePage(
    NavigateToHomePage event,
    Emitter<AuthState> emit,
  ) {
    event.context.replaceRoute(
      const HomePageRoute(),
    );
  }

  void _navigateToSignInScreen(
    NavigateToSignInScreen event,
    Emitter<AuthState> emit,
  ) {
    event.context.replaceRoute(
      SignInScreenRoute(),
    );
  }
}
