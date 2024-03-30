import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_exam/features/home/home_event.dart';
import 'package:interview_exam/features/home/home_state.dart';
import 'package:interview_exam/repositories/local_storage_repository.dart';
import 'package:interview_exam/repositories/post_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostRepository postRepository;
  final LocalStorageRepository localStorageRepository;

  HomeBloc({
    required this.postRepository,
    required this.localStorageRepository,
  }) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {
      _mapEventToState(event, emit);
    });
  }

  Future _mapEventToState(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    switch (event) {
      case HomeEventLogout _:
        {
          localStorageRepository.deletedSignedInUserModel();
          emit(state.copyWith(isSignedOut: true));
        }
    }
  }
}
