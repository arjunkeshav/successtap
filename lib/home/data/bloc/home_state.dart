part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeTapEventSuccessState extends HomeState {
  final TapEventResponse tapEventResponse;
  const HomeTapEventSuccessState({required this.tapEventResponse});

  @override
  List<Object> get props => [tapEventResponse];
}

