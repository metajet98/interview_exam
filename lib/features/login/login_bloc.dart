import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/login/login_event.dart';
import 'package:interview_exam/features/login/login_form_status.dart';
import 'package:interview_exam/features/login/login_state.dart';
import 'package:interview_exam/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({
    required this.authRepository,
  }) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await _mapEventToState(event, emit);
    });
  }

  Future _mapEventToState(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    switch (event) {
      case LoginEventUsernameChange _:
        {
          emit(state.copyWith(username: event.username));
        }
      case LoginEventPasswordChange _:
        {
          emit(state.copyWith(password: event.password));
        }
      case LoginEventSubmit _:
        {
          emit(state.copyWith(status: LoginFormSubmittingStatus()));
          final response = await authRepository.login(
            username: state.username,
            password: state.password,
          );
          // failed
          if (response.isSuccess == false) {
            emit(
              state.copyWith(
                status: LoginFormFailedStatus(
                  message: 'Wrong username or password!',
                ),
              ),
            );
            return;
          }
          // success
          emit(
            state.copyWith(
              status: LoginFormSuccessStatus(
                userModel: response.userModel!,
              ),
            ),
          );
        }
    }
  }
}