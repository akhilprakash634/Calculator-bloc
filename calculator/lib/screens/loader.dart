import 'package:calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

class loadingscreen extends StatelessWidget {
  const loadingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 4)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Image.asset(
              'assets/iPhone_8_Plus__iPhone_7_Plus__iPhone_6s_Plus__iPhone_6_Plus_portrait.png',
              fit: BoxFit.cover,
            );
          } else {
            return CalculatorScreen();
          }
        },
      ),
    );
  }
}
