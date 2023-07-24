import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class ResetPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ResetPasswordForm({
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
                  }
                },
                listenWhen: (_, AuthState current) {
                  return current.isSubmissionFailed == true;
                },
                child: ButtonSubmit(
                  formKey: formKey,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.add(ResetPasswordSubmitted());
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
