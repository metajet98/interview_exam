import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/login/login_bloc.dart';
import 'package:interview_exam/features/login/login_event.dart';

class LoginUsernameTextField extends StatelessWidget {
  const LoginUsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        hintText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Please input username!';
        }
        return null;
      },
      onChanged: (username) => context.read<LoginBloc>().add(
            LoginEventUsernameChange(
              username: username,
            ),
          ),
    );
  }
}
