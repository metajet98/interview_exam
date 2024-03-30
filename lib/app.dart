import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_exam/features/home/home_screen.dart';
import 'package:interview_exam/features/login/login_screen.dart';
import 'package:interview_exam/repositories/auth_repository.dart';
import 'package:interview_exam/repositories/local_storage_repository.dart';
import 'package:interview_exam/repositories/post_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final isSignedIn =
        GetIt.instance<LocalStorageRepository>().getCurrentUserModel() != null;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GetIt.I<AuthRepository>(),
        ),
        RepositoryProvider(
          create: (context) => GetIt.I<PostRepository>(),
        ),
        RepositoryProvider(
          create: (context) => GetIt.I<LocalStorageRepository>(),
        ),
      ],
      child: MaterialApp(
        home: isSignedIn ? const HomeScreen() : LoginScreen(),
      ),
    );
  }
}
