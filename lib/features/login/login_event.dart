import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginEventUsernameChange extends LoginEvent {
  final String? username;

  LoginEventUsernameChange({this.username});

  @override
  List<Object?> get props => [username];
}

class LoginEventPasswordChange extends LoginEvent {
  final String? password;

  LoginEventPasswordChange({this.password});

  @override
  List<Object?> get props => [password];
}

class LoginEventSubmit extends LoginEvent {
  @override
  List<Object?> get props => [];
}
