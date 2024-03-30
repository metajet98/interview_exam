import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isSignedOut;

  const HomeState({
    this.isSignedOut = false,
  });

  HomeState copyWith({
    bool? isSignedOut,
  }) {
    return HomeState(
      isSignedOut: isSignedOut ?? this.isSignedOut,
    );
  }

  @override
  List<Object?> get props => [
        isSignedOut,
      ];
}
