enum PostListSortType {
  date,
  like,
  share,
  comment;

  String get displayName {
    return switch (this) {
      PostListSortType.date => 'Date',
      PostListSortType.like => 'Like',
      PostListSortType.share => 'Share',
      PostListSortType.comment => 'Comment',
    };
  }
}
