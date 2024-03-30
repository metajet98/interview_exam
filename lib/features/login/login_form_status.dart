import 'package:interview_exam/models/user_model.dart';

abstract class LoginFormStatus {
  const LoginFormStatus();
}

class LoginFormInitialStatus extends LoginFormStatus {
  const LoginFormInitialStatus();
}

class LoginFormSubmittingStatus extends LoginFormStatus {}

class LoginFormSuccessStatus extends LoginFormStatus {
  final UserModel userModel;

  LoginFormSuccessStatus({
    required this.userModel,
  });
}

class LoginFormFailedStatus extends LoginFormStatus {
  final String message;

  LoginFormFailedStatus({
    required this.message,
  });
}
