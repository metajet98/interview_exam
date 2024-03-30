part of 'post_list_cubit.dart';

enum PostListStatus { loading, success, failure }

final class PostListState extends Equatable {
  final PostListStatus status;
  final List<PostModel> postModels;
  final PostListSortType sortType;

  const PostListState._({
    this.status = PostListStatus.loading,
    this.postModels = const <PostModel>[],
    this.sortType = PostListSortType.date,
  });

  const PostListState.loading() : this._();

  const PostListState.success(List<PostModel> postModels)
      : this._(status: PostListStatus.success, postModels: postModels);

  const PostListState.failure() : this._(status: PostListStatus.failure);

  PostListState copyWith({
    PostListSortType? sortType,
    List<PostModel>? postModels,
    PostListStatus? status,
  }) {
    return PostListState._(
      sortType: sortType ?? this.sortType,
      postModels: postModels ?? this.postModels,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, postModels];
}
