import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:speak_it_kz/src/features/auth/presentation/screens/profile_page.dart';
import 'package:speak_it_kz/src/features/auth/user_secure_storage.dart';
import '../../../../../assets/my_colors.dart';
import '../../../../shared/widgets/custom_buttons.dart';
import '../widgets/auth_textfields.dart';

import 'package:http/http.dart' as http;
import 'package:speak_it_kz/network_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();

  String emailError = '';
  String passwordError = '';

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
                      setState(() {
                        emailError = '';
                      });
                    },
                    customValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the email address';
                      }

                      if (emailError == 'Email address is not registered') {
                        return emailError;
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
                      setState(() {
                        passwordError = '';
                      });
                    },
                    customValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the password';
                      }

                      if (passwordError == 'Invalid password') {
                        return passwordError;
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
    return () async {
      print('Login button pressed');

      if (_formKey.currentState!.validate()) {
        Map<String, String> data = {
          "email": emailController.text,
          "password": passwordController.text
        };

        String url = "${networkHandler.baseUrl}/auth/login";
        var response = await http.post(Uri.parse(url), body: data);

        if (response.statusCode == 404) {
          setState(() {
            emailError = 'Email address is not registered';
          });
          _formKey.currentState!.validate();
        } else if (response.statusCode == 401) {
          setState(() {
            passwordError = 'Invalid password';
          });
          _formKey.currentState!.validate();
        } else {
          setState(() {
            emailError = '';
            passwordError = '';
          });
          print('Data validated successfully');

          Map<String, dynamic> output = json.decode(response.body);

          print('Token: ${output['accessToken']}');
          await UserSecureStorage.setToken(output['accessToken']);
          await UserSecureStorage.setEmail(data['email']);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        }
      }
    };
  }
}
