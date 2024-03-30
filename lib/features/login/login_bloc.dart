import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/login/login_event.dart';
import 'package:interview_exam/features/login/login_form_status.dart';
import 'package:interview_exam/features/login/login_state.dart';
import 'package:interview_exam/repositories/auth_repository.dart';
import 'package:interview_exam/repositories/local_storage_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final LocalStorageRepository localStorageRepository;

  LoginBloc({
    required this.authRepository,
    required this.localStorageRepository,
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
          // prevent duplicate action from user
          if (state.status is LoginFormSubmittingStatus) return;
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
          localStorageRepository.setSignedInUserModel(
            userModel: response.userModel!,
          );
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
