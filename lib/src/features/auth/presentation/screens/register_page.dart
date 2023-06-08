import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/network_handler.dart';
import 'package:speak_it_kz/src/features/auth/presentation/screens/login_page.dart';
import 'package:speak_it_kz/src/features/auth/presentation/screens/profile_page.dart';
import '../../../../shared/widgets/custom_buttons.dart';
import '../widgets/auth_textfields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  String? languageController = "EN";

  String errorText = 'The field cannot be empty';

  String emailError = '';
  bool validate = false;
  bool circular = false;

  NetworkHandler networkHandler = NetworkHandler();

  String _nameValue = '';
  String _emailValue = '';
  String _passwordValue = '';
  String _confirmationPasswordValue = '';

  static List<String> langList = ['EN', 'FR', 'ES'];
  String dropdownValue = langList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
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
                'Register',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthTextFormField(
                      textEditController: nameController,
                      labelText: 'Name',
                      isObscured: false,
                      onChanged: (value) {
                        _nameValue = value;
                      },
                      customValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return errorText;
                        }

                        if (value[0] == '1' ||
                            value[0] == '2' ||
                            value[0] == '3' ||
                            value[0] == '4' ||
                            value[0] == '5' ||
                            value[0] == '6' ||
                            value[0] == '7' ||
                            value[0] == '8' ||
                            value[0] == '9' ||
                            value[0] == '0') {
                          return 'The username cannot start with number';
                        }

                        return null;
                      },
                    ),
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
                          setState(() {
                            emailError = errorText;
                          });
                          return emailError;
                        }

                        if (!value.contains('@') ||
                            !value.contains('.') ||
                            value.length < 12) {
                          setState(() {
                            emailError = 'Input is invalid';
                          });
                          return emailError;
                        }

                        if (emailError == 'Email address is already taken') {
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
                      },
                      customValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return errorText;
                        } else if (value.length < 8) {
                          return 'The length must be 8 characters or more';
                        }
                        return null;
                      },
                    ),
                    AuthTextFormField(
                      textEditController: passwordController2,
                      labelText: 'Repeat password',
                      isObscured: true,
                      onChanged: (value) {
                        _confirmationPasswordValue = value;
                      },
                      customValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return errorText;
                        }
                        if (_confirmationPasswordValue != _passwordValue) {
                          return "Inputs doesn't match";
                        }
                        return null;
                      },
                    ),
                    // -------------------- DROPDOWN BUTTON --------------------
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),

                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.grey, width: 1),
                      //     borderRadius: BorderRadius.circular(5),
                      // ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            labelText: 'Language',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        style: Theme.of(context).textTheme.bodyLarge,
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            languageController = value;
                          });
                        },
                        items: langList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    circular
                        ? CircularProgressIndicator()
                        : CustomButton(
                            onTap: _registerButtonPressed, text: 'Register'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _registerButtonPressed() {
    return (() async {
      setState(() {
        circular = true;
      });
      print('Register button pressed');

      if (_formKey.currentState!.validate()) {
        Map<String, String> data = {
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "role": "USER",
          "language": "EN" // TODO: Make it changable
        };
        print(data);

        // Fetching user data

        String url = "${networkHandler.baseUrl}/auth/register";
        var response = await http.post(Uri.parse(url), body: data);
        print(response.statusCode);
        if (response.statusCode == 404) {
          setState(() {
            emailError = 'Email address is already taken';
          });
          _formKey.currentState!.validate();
          print('The error text changed');
          setState(() {
            circular = false;
          });
        } else {
          setState(() {
            emailError = '';
          });
          print('Data validated successfully');

          setState(() {
            circular = false;
          });

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      } else {
        setState(() {
          circular = false;
        });
      }
    });
  }
}
