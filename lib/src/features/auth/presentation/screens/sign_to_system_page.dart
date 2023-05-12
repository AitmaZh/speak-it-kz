import 'package:flutter/material.dart';

import 'package:speak_it_kz/src/features/auth/presentation/screens/login_page.dart';
import 'package:speak_it_kz/src/features/auth/presentation/screens/register_page.dart';
import 'package:speak_it_kz/src/shared/widgets/custom_buttons.dart';

class SignToSystemScreen extends StatelessWidget {
  const SignToSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    signInButtonPressed() {
      return (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }

    joinButtonPressed() {
      return (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      });
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Speak IT',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(onTap: signInButtonPressed, text: 'Sign in'),
              CustomButton(onTap: joinButtonPressed, text: 'Join for free'),
            ],
          ),
        ],
      )),
    );
  }
}
