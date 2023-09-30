import 'package:flutter/material.dart';

import 'constants.dart';
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
          backgroundColor: defaultColor,
          iconTheme: IconThemeData(
            color: titlesColor,
          )
        ),
      ),
      home: const BmiCalculator(),
    );
  }
}
