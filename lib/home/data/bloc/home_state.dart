part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeTapEventSuccessState extends HomeState {
  final int randomNum;
  const HomeTapEventSuccessState({required this.randomNum});

  @override
  List<Object> get props => [randomNum];
}

class HomeTapEventFailureState extends HomeState {
  final int randomNum;
  const HomeTapEventFailureState({required this.randomNum});
  @override
  List<Object> get props => [randomNum];
}
