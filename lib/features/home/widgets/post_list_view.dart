import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/home/cubit/post_list_cubit.dart';
import 'package:interview_exam/features/home/widgets/post_list_skeleton.dart';
import 'package:interview_exam/features/home/widgets/post_list_tile.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostListCubit>().state;
    switch (state.status) {
      case PostListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case PostListStatus.success:
        final postModels = state.postModels;
        if (postModels.isEmpty) return const Text("Empty");
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: postModels.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return PostListTile(postModel: postModels[index]);
          },
        );
      case PostListStatus.loading:
        return const PostListSkeleton();
    }
  }
}
