import 'package:flutter/material.dart';
import 'home_page.dart';
import 'assets/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speak IT',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: backgroundColor,
        primarySwatch: primaryColor,

        fontFamily: 'Roboto',

        textTheme: TextTheme(
          displaySmall: TextStyle(color: primaryColor),
          headlineMedium: TextStyle(color: primaryColor.shade700, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(color: primaryColor.shade400),
          labelLarge: const TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
