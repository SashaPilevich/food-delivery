import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
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
                hintText: 'authScreens.userName'.tr(),
                icon: const Icon(
                  Icons.person,
                ),
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'authScreens.userNameIsRequired'.tr();
                  } else if (value.length < 3) {
                    return 'authScreens.invalidUserName'.tr();
                  }
                  return null;
                },
                textEditingController: userNameController,
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
              SizedBox(
                height: mediaQueryData.size.height * 0.103,
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
                      NavigateToHomePage(),
                    );
                  }
                },
                listenWhen: (AuthState previous, AuthState current) {
                  return previous.formStatus != current.formStatus;
                },
                child: ButtonSubmit(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        SignUpSubmitted(
                          userName: userNameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
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
                  bloc.add(ChangeSignPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
