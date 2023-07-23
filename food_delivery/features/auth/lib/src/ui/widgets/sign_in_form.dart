import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation/navigation.dart';
import 'widgets.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignInForm({
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

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
                height: AppSize.size10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        context.pushRoute(
                          ResetPasswordScreenRoute(),
                        );
                      },
                      child: Text(
                        'authScreens.forgotPassword'.tr(),
                      )),
                ],
              ),
              const SizedBox(
                height: AppSize.size10,
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
                },
                listenWhen: (_, AuthState current) {
                  return current.isSubmissionFailed == true;
                },
                child: ButtonSubmit(
                  formKey: formKey,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.add(SignInSubmitted());
                    }
                  },
                  label: 'authScreens.signIn'.tr(),
                ),
              ),
              const SizedBox(
                height: AppSize.size20,
              ),
              Text('authScreens.or'.tr()),
              const SizedBox(
                height: AppSize.size20,
              ),
              SizedBox(
                width: mediaQueryData.size.width * 0.9,
                child: ElevatedButton.icon(
                  onPressed: () {
                    bloc.add(SignInWithGoogleSubmitted());
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                  ),
                  label: Text(
                    'authScreens.signInWithGoogle'.tr(),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.size30,
              ),
              SignInSignUpSwitch(
                title: 'authScreens.dontHaveAccount'.tr(),
                label: 'authScreens.signUp'.tr(),
                onPressed: () {
                  context.replaceRoute(
                    SignUpScreenRoute(),
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
