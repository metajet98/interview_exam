// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      authorId: json['author'] as String,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(json['createdDate'] as int),
      imageUrl: json['image'] as String,
      title: json['title'] as String,
      likeCount: json['liked'] as int,
      shareCount: json['shared'] as int,
      commentCount: json['comments'] as int,
    );
