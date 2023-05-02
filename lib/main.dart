import 'package:flutter/material.dart';
import 'home_page.dart';
import 'assets/my_color.dart';

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
        // primaryColor: const Color.fromRGBO(19, 41, 61, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(232, 241, 242, 1),
        primarySwatch: myColor,

        fontFamily: 'San Serif',

        /* textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ), */
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
