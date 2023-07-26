import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpForm({
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.padding40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                hintText: 'authScreens.userName'.tr(),
                icon: const Icon(
                  Icons.person,
                ),
                obscureText: false,
                onChanged: (value) {
                  bloc.add(
                    UserNameFieldChange(userName: value),
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'authScreens.userNameIsRequired'.tr();
                  } else if (value.length < 3) {
                    return 'authScreens.invalidUserName'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: AppSize.size30,
              ),
              CustomTextField(
                hintText: 'authScreens.email'.tr(),
                icon: const Icon(
                  Icons.email_outlined,
                ),
                obscureText: false,
                onChanged: (value) {
                  bloc.add(
                    EmailFieldChange(email: value),
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'authScreens.emailIsRequired'.tr();
                  } else if (!value.contains('@')) {
                    return 'authScreens.invalidEmailFormat'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: AppSize.size30,
              ),
              CustomTextField(
                hintText: 'authScreens.password'.tr(),
                icon: const Icon(
                  Icons.security,
                ),
                obscureText: true,
                onChanged: (value) {
                  bloc.add(
                    PasswordFieldChange(password: value),
                  );
                },
                validator: (value) {
                  return value!.length < 6
                      ? 'authScreens.invalidPassword'.tr()
                      : null;
                },
              ),
              const SizedBox(
                height: AppSize.size30,
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (BuildContext context, AuthState state) {
                  final FormSubmissionStatus formStatus = bloc.state.formStatus;
                  if (formStatus is SubmissionFailed) {
                    _showSnackBar(
                      context,
                      formStatus.exception.toString(),
                    );
                  }
                  if (formStatus is SubmissionSuccess) {
                    bloc.add(
                      NavigateToHomePage(context: context),
                    );
                  }
                },
                listenWhen: (AuthState previous, AuthState current) {
                  return previous.formStatus != current.formStatus;
                },
                child: ButtonSubmit(
                  formKey: formKey,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.add(SignUpSubmitted());
                    }
                  },
                  label: 'authScreens.signUp'.tr(),
                ),
              ),
              const SizedBox(
                height: AppSize.size30,
              ),
              SignInSignUpSwitch(
                title: 'authScreens.haveAccount'.tr(),
                label: 'authScreens.signIn'.tr(),
                onPressed: () {
                  bloc.add(
                    NavigateToSignInScreen(context: context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
