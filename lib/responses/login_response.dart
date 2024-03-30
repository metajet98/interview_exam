import 'package:interview_exam/models/user_model.dart';

class LoginResponse {
  final bool isSuccess;
  final UserModel? userModel;

  LoginResponse({
    required this.isSuccess,
    required this.userModel,
  });
}
