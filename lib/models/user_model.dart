import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class UserModel {
  final String id;
  final String username;
  final String name;
  @JsonKey(name: 'avatar')
  final String avatarUrl;
  final String password;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.avatarUrl,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromJsonString(String jsonString) {
    final jsonObject = json.decode(jsonString);
    return UserModel.fromJson(jsonObject);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String toJsonString() => json.encode(toJson());
}
