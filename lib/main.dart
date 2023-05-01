import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

MaterialColor myColor = MaterialColor(
  const Color.fromRGBO(19, 41, 61, 1).value,
  <int, Color>{
    50: Color.fromRGBO(19, 41, 61, 0.1),
    100: Color.fromRGBO(19, 41, 61, 0.2),
    200: Color.fromRGBO(19, 41, 61, 0.3),
    300: Color.fromRGBO(19, 41, 61, 0.4),
    400: Color.fromRGBO(19, 41, 61, 0.5),
    500: Color.fromRGBO(19, 41, 61, 0.6),
    600: Color.fromRGBO(19, 41, 61, 0.7),
    700: Color.fromRGBO(19, 41, 61, 0.8),
    800: Color.fromRGBO(19, 41, 61, 0.9),
    900: Color.fromRGBO(19, 41, 61, 1),
  },
);

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
      home: const MyHomePage(title: 'Fglutter Demo Home Pae'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
