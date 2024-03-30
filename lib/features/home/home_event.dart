import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomeEventLogout extends HomeEvent {
  @override
  List<Object?> get props => [];
}
