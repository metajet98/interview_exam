import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/login/login_bloc.dart';
import 'package:interview_exam/features/login/login_event.dart';
import 'package:interview_exam/features/login/login_form_status.dart';

class LoginSubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginSubmitButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<LoginBloc>().add(LoginEventSubmit());
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Login'),
          if (state.status is LoginFormSubmittingStatus) ...[
            const SizedBox(width: 8),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 2,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
