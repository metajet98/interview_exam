import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/login/login_screen.dart';
import 'package:interview_exam/repositories/auth_repository.dart';
import 'package:interview_exam/repositories/post_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => PostRepository(),
        ),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
