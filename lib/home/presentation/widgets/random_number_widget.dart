import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:successtap/core/constants/strings.dart';
import 'package:successtap/home/data/bloc/home_bloc.dart';

class RandomNumberWidget extends StatelessWidget {
  const RandomNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)]),
      width: MediaQuery.of(context).size.width * .4,
      height: MediaQuery.of(context).size.width * .4,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Center(
              child: Text(
            state is HomeInitialState
                ? Strings.randomNumber
                : '${state is HomeTapEventSuccessState ? state.tapEventResponse.randomNum : "Loading"}',
            style: const TextStyle(fontSize: 22),
          ));
        },
      ),
    );
  }
}
