import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation/navigation.dart';
import 'widgets.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'authScreens.emailIsRequired'.tr();
                  } else if (!value.contains('@')) {
                    return 'authScreens.invalidEmailFormat'.tr();
                  }
                  return null;
                },
                textEditingController: emailController,
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
                validator: (value) {
                  return value!.length < 6
                      ? 'authScreens.invalidPassword'.tr()
                      : null;
                },
                textEditingController: passwordController,
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
                  formKey: _formKey,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        SignInSubmitted(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
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
