import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:successtap/home/model/tapEventResponse.dart';

import '../providers/tap_event_provider.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TapEventProvider tapEventProvider;

  HomeBloc({required this.tapEventProvider}) : super(HomeInitialState()) {
    on<TappingEvent>((event, emit) async {
      emit(HomeLoadingState());
      final tapEventResponse = await tapEventProvider.handleTapEvent();
      emit(HomeTapEventSuccessState(tapEventResponse: tapEventResponse));
    });
  }
}
