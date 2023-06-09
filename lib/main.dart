import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'assets/my_colors.dart';
import 'src/shared/widgets/persistent_bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import '.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = stripePublishbleKey;
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speak IT',
      home: const PersistentBottomNavBar(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primaryColor,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayMedium: TextStyle(
              fontSize: 36, color: secondaryColor, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(color: primaryColor),
          headlineLarge: TextStyle(
              color: primaryColor.shade700, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: primaryColor.shade700, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(color: primaryColor.shade700),
          titleMedium: TextStyle(color: primaryColor),
          titleSmall: TextStyle(color: secondaryColor, fontSize: 22),
          labelLarge: TextStyle(
              color: ButtonColors.elevatedButtonTextColor, fontSize: 16),
          labelMedium: TextStyle(color: secondaryColor),
          bodyMedium:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
