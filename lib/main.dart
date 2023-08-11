import 'package:flutter/material.dart';
import 'pages/on_boarding_screen.dart';
void main() {
  runApp(const OnBoardingScreenUi());
}

class OnBoardingScreenUi extends StatelessWidget {
  const OnBoardingScreenUi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'on boarding',
      home: OnBoardingScreen(),
    );
  }
}