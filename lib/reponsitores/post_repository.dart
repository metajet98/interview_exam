import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:interview_exam/models/post_model.dart';

class PostRepository {
  late final List<PostModel> _postModels;

  Future<List<PostModel>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return _postModels;
  }

  Future<void> readDataFromFile() async {
    final jsonList = jsonDecode(
      await rootBundle.loadString("assets/data.json"),
    );
    _postModels = List<PostModel>.from(
      jsonList.map((json) => PostModel.fromJson(json)),
    );
  }
}
