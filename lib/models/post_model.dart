import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: false,
)
class PostModel {
  @JsonKey(name: 'author')
  final String authorId;
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  final DateTime createdDate;
  @JsonKey(name: 'image')
  final String imageUrl;
  final String title;
  @JsonKey(name: 'liked')
  final int likeCount;
  @JsonKey(name: 'shared')
  final int shareCount;
  @JsonKey(name: 'comments')
  final int commentCount;

  PostModel({
    required this.authorId,
    required this.createdDate,
    required this.imageUrl,
    required this.title,
    required this.likeCount,
    required this.shareCount,
    required this.commentCount,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
