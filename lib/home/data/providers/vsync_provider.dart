import 'package:flutter/material.dart';

class MyVSyncProvider extends StatefulWidget {
  final Widget child;

  const MyVSyncProvider({super.key, required this.child});

  @override
  MyVSyncProviderState createState() => MyVSyncProviderState();
}

class MyVSyncProviderState extends State<MyVSyncProvider> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // Use this as the vsync provider
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose of the animation controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}