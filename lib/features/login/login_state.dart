import 'package:equatable/equatable.dart';
import 'package:interview_exam/features/login/login_form_status.dart';

class LoginState extends Equatable {
  final String username;
  final String password;
  final LoginFormStatus status;

  const LoginState({
    this.username = '',
    this.password = '',
    this.status = const LoginFormInitialStatus(),
  });

  LoginState copyWith({
    String? username,
    String? password,
    LoginFormStatus? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [username, password, status];
}
