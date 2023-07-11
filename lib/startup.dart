import 'package:flutter/material.dart';
import 'package:hm_test_implementation/screens/humor_screen.dart';

class StartupWidget extends StatelessWidget {
  const StartupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF011E31),
      ),
      home: const HumorScreen(),
    );
  }
}
