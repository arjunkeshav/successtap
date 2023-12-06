import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:successtap/home/data/providers/vsync_provider.dart';

import 'home/data/bloc/home_bloc.dart';
import 'home/data/providers/tap_event_provider.dart';
import 'home/presentation/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return MyVSyncProvider(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => TapEventProvider()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => HomeBloc(tapEventProvider: RepositoryProvider.of<TapEventProvider>(context))),
          ],
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Success Tap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
