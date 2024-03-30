import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/login/login_bloc.dart';
import 'package:interview_exam/features/login/login_form_status.dart';
import 'package:interview_exam/features/login/login_state.dart';
import 'package:interview_exam/features/login/widgets/login_password_text_field.dart';
import 'package:interview_exam/features/login/widgets/login_submit_button.dart';
import 'package:interview_exam/features/login/widgets/login_username_text_field.dart';
import 'package:interview_exam/repositories/auth_repository.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          final status = state.status;
          switch (status) {
            case LoginFormFailedStatus _:
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(status.message),
                  ),
                );
              }
            case LoginFormSuccessStatus _:
              {}
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome!'),
            backgroundColor: Colors.green,
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LoginUsernameTextField(),
                    const SizedBox(height: 12),
                    const LoginPasswordTextField(),
                    const SizedBox(height: 32),
                    LoginSubmitButton(formKey: _formKey),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
