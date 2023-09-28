import 'package:flutter/material.dart';

import 'screens/bmi_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
        ),
        scaffoldBackgroundColor: Colors.white70,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white70.withOpacity(0.8),
          )
        ),
      ),
      home: const BmiCalculator(),
    );
  }
}
