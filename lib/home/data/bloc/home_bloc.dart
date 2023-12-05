import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../providers/tap_event_provider.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TapEventProvider tapEventProvider;
  HomeBloc({required this.tapEventProvider}) : super(HomeInitialState()) {
    // int successCount = 0;

  }
}
