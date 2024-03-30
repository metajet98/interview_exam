import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/home/home_bloc.dart';
import 'package:interview_exam/features/home/home_event.dart';
import 'package:interview_exam/features/home/home_state.dart';
import 'package:interview_exam/features/login/login_screen.dart';
import 'package:interview_exam/repositories/local_storage_repository.dart';
import 'package:interview_exam/repositories/post_repository.dart';

class HomeScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        postRepository: context.read<PostRepository>(),
        localStorageRepository: context.read<LocalStorageRepository>(),
      ),
      child: Builder(
        builder: (context) {
          return BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.isSignedOut) {
                Navigator.of(context).pushReplacement(LoginScreen.route());
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: Colors.green,
                actions: [
                  IconButton(
                    onPressed: () => context.read<HomeBloc>().add(
                          HomeEventLogout(),
                        ),
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              body: Container(),
            ),
          );
        },
      ),
    );
  }
}
