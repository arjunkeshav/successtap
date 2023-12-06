import 'package:flutter/material.dart';
import 'package:successtap/core/constants/strings.dart';

import '../widgets/random_number_widget.dart';
import '../widgets/result_widget.dart';
import '../widgets/tapping_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(Strings.appName),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(child: ResultWidget()),
          const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: TappingWidget()),
              Expanded(child: RandomNumberWidget()),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .2,
          )
        ],
      ),
    );
  }
}
