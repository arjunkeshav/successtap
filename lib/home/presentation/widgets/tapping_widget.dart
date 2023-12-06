// tapping_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:successtap/core/constants/strings.dart';

import '../../data/bloc/home_bloc.dart';

class TappingWidget extends StatefulWidget {
  const TappingWidget({super.key});

  @override
  State<TappingWidget> createState() => _TappingWidgetState();
}

class _TappingWidgetState extends State<TappingWidget> {
  ValueNotifier<bool> notifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => notifier.value = true,
      onTapUp: (_) => notifier.value = false,
      onTap: () {
        // notifier.value=true;
        BlocProvider.of<HomeBloc>(context).add(TappingEvent());
      },
      child: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (BuildContext context, value, Widget? child) {
          return AnimatedContainer(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(blurRadius: value ? 0 : 2, spreadRadius: value ? 0 : 2, color: Colors.black12)]),
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.width * .4,
            duration: const Duration(milliseconds: 150),
            child: const Center(
              child: Text(
                Strings.tapHere,
                style: TextStyle(fontSize: 22),
              ),
            ),
          );
        },
      ),
    );
  }
}
