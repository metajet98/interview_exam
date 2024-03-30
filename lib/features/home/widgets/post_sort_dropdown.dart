import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/home/cubit/post_list_cubit.dart';
import 'package:interview_exam/features/home/cubit/post_list_sort_type.dart';

class PostSortDropdown extends StatelessWidget {
  const PostSortDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostListCubit>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Sort by: '),
        DropdownButton(
          padding: const EdgeInsets.only(right: 12),
          value: state.sortType,
          items: PostListSortType.values
              .map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(type.displayName),
                ),
              )
              .toList(),
          onChanged: (type) {
            if (type == null) return;
            context.read<PostListCubit>().sortList(sortType: type);
          },
        )
      ],
    );
  }
}
