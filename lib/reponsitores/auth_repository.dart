import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:interview_exam/models/user_model.dart';
import 'package:interview_exam/responses/login_response.dart';

class AuthRepository {
  late final List<UserModel> _userModels;

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    final userModel = _userModels.firstWhereOrNull(
      (element) => element.username == username && element.password == password,
    );
    if (userModel != null) {
      return LoginResponse(isSuccess: true, userModel: userModel);
    }
    return LoginResponse(isSuccess: false, userModel: null);
  }

  Future<void> readDataFromFile() async {
    final jsonList = jsonDecode(
      await rootBundle.loadString("assets/auth.json"),
    );
    _userModels = List<UserModel>.from(
      jsonList.map((json) => UserModel.fromJson(json)),
    );
  }
}
