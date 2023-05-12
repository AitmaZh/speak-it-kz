import 'package:flutter/material.dart';

import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/network_handler.dart';
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

  NetworkHandler networkHandler = NetworkHandler();

  String _nameValue = '';
  String _emailValue = '';
  String _passwordValue = '';
  String _confirmationPasswordValue = '';
  String _langValue = '';

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
                          return 'Please enter your name';
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
                      },
                      customValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }

                        if (!value.contains('@') ||
                            !value.contains('.') ||
                            value.length < 12) {
                          return 'Input is invalid';
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
                          return 'Please enter password';
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
                          return 'Please confirm the password';
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
                            dropdownValue = value!;
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
                    CustomButton(
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
    return (() {
      print('Register button pressed');

      if (_formKey.currentState!.validate()) {
        networkHandler.get('');
        print('Data validated successfully');

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
      }
    });
  }
}
