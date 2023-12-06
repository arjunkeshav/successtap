import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:successtap/core/constants/strings.dart';
import 'package:successtap/home/data/bloc/home_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/assets.dart'; // Import Lottie package

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)]),
              child: state is HomeInitialState
                  ? const Center(
                      child: Text(
                      Strings.initialState,
                      style: TextStyle(fontSize: 20),
                    ))
                  : state is HomeTapEventSuccessState
                      ? Center(
                          child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.tapEventResponse.isSuccessMatch ? Strings.randomNumMatch : Strings.tryAgain,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                                state.tapEventResponse.isSuccessMatch
                                    ? Strings.totalSuccess + state.tapEventResponse.successCount.toString()
                                    : "",
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                          ],
                        ))
                      : const SizedBox(),
            ),
            if (state is HomeTapEventSuccessState)
              Positioned.fill(
                  child: state.tapEventResponse.isSuccessMatch
                      ? Lottie.asset(
                          Assets.successCelebration, // Replace with the actual path to your Lottie JSON file
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox())
          ],
        );
      },
    );
  }
}
