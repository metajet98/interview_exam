import 'package:equatable/equatable.dart';
import 'package:interview_exam/models/user_model.dart';

class HomeState extends Equatable {
  final bool isSignedOut;
  final UserModel? userModel;

  const HomeState({
    this.isSignedOut = false,
    this.userModel,
  });

  HomeState copyWith({
    bool? isSignedOut,
    UserModel? userModel,
  }) {
    return HomeState(
      isSignedOut: isSignedOut ?? this.isSignedOut,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
        isSignedOut,
      ];
}
