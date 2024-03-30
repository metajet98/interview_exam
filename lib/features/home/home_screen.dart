import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/home/cubit/post_list_cubit.dart';
import 'package:interview_exam/features/home/home_bloc.dart';
import 'package:interview_exam/features/home/home_event.dart';
import 'package:interview_exam/features/home/home_state.dart';
import 'package:interview_exam/features/home/widgets/post_list_view.dart';
import 'package:interview_exam/features/home/widgets/post_sort_dropdown.dart';
import 'package:interview_exam/features/home/widgets/profile_info.dart';
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
                automaticallyImplyLeading: false,
                backgroundColor: Colors.green,
                centerTitle: false,
                title: const ProfileInfo(),
                actions: [
                  IconButton(
                    onPressed: () => _onTapLogoutButton(context),
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              body: BlocProvider(
                create: (_) => PostListCubit(
                  postRepository: context.read<PostRepository>(),
                )..fetchList(),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: PostSortDropdown(),
                    ),
                    Expanded(
                      child: PostListView(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTapLogoutButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Logging out"),
        content: const Text("Do you want to log out?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Logout"),
            onPressed: () {
              context.read<HomeBloc>().add(HomeEventLogout());
            },
          ),
        ],
      ),
    );
  }
}
