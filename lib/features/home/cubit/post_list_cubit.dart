import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/home/cubit/post_list_sort_type.dart';
import 'package:interview_exam/models/post_model.dart';
import 'package:interview_exam/repositories/post_repository.dart';

part 'post_list_state.dart';

class PostListCubit extends Cubit<PostListState> {
  final PostRepository postRepository;

  PostListCubit({
    required this.postRepository,
  }) : super(const PostListState.loading());

  Future<void> fetchList() async {
    try {
      final postModels = await postRepository.getPosts();
      // default: sort by datetime
      postModels.sort((a, b) => b.createdDate.compareTo(a.createdDate));
      emit(PostListState.success(postModels));
    } on Exception {
      emit(const PostListState.failure());
    }
  }

  void sortList({
    required PostListSortType sortType,
  }) {
    final postModels = state.postModels.toList();
    postModels.sort(
      (a, b) => switch (sortType) {
        PostListSortType.date => b.createdDate.compareTo(a.createdDate),
        PostListSortType.like => b.likeCount.compareTo(a.likeCount),
        PostListSortType.share => b.shareCount.compareTo(a.shareCount),
        PostListSortType.comment => b.commentCount.compareTo(a.commentCount),
      },
    );
    emit(state.copyWith(postModels: postModels, sortType: sortType));
  }
}
