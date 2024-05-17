part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitialCallEvent extends HomeEvent{
  const HomeInitialCallEvent();
  @override
  List<Object?> get props => [];
}