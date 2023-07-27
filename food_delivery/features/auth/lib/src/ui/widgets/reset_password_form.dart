import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);

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
                    _showSnackBar(
                      context,
                      'authScreens.checkEmail'.tr(),
                    );
                    bloc.add(
                      NavigateToSignInScreen(context: context),
                    );
                  }
                },
                listenWhen: (AuthState previous, AuthState current) {
                  return current.formStatus != previous.formStatus;
                },
                child: ButtonSubmit(
                  formKey: _formKey,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        ResetPasswordSubmitted(
                          email: emailController.text.trim(),
                        ),
                      );
                    }
                  },
                  label: 'authScreens.resetPassword'.tr(),
                ),
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
