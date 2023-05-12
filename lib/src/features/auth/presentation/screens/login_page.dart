import 'package:flutter/material.dart';

import 'package:speak_it_kz/src/features/auth/presentation/screens/profile_page.dart';
import '../../../../../assets/my_colors.dart';
import '../../../../shared/widgets/custom_buttons.dart';
import '../widgets/auth_textfields.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final storage = const FlutterSecureStorage();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String _emailValue = '';

  String _passwordValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextFormField(
                    textEditController: emailController,
                    labelText: 'Email',
                    isObscured: false,
                    onChanged: (value) {
                      _emailValue = value;
                    },
                    customValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the email address';
                      }
                      return null;
                    },
                  ),
                  AuthTextFormField(
                    textEditController: passwordController,
                    labelText: 'Password',
                    isObscured: true,
                    onChanged: (value) {
                      _passwordValue = value;
                    },
                    customValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the password';
                      }
                      return null;
                    },
                  ),
                  CustomButton(onTap: _loginButtonPressed, text: 'Login'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loginButtonPressed() {
    return () {
      print('Login button pressed');

      if (_formKey.currentState!.validate()) {
        print('Data validated successfully');

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
      }
    };
  }
}
