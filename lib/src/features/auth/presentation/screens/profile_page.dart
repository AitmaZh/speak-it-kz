import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/network_handler.dart';
import 'package:speak_it_kz/src/features/auth/api/google_sign_in_api.dart';
import 'package:speak_it_kz/src/features/auth/presentation/screens/sign_to_system_page.dart';
import 'package:speak_it_kz/src/shared/widgets/custom_buttons.dart';
import '../widgets/profile_items.dart';
import 'package:http/http.dart' as http;

// Global variables
const topContainerHeight = 180.0;
const profilePhotoSize = 120.0;

class ProfileScreen extends StatefulWidget {
  dynamic email;
  ProfileScreen({super.key, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  dynamic userName = 'Draft';

  fetchUserData() async {
    var url = '${networkHandler.baseUrl}/users/${widget.email}';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);

      setState(() {
        userName = (data['name']);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    late String profileName = userName;
    late String profileEmail = widget.email;
    const buttonText = 'Logout';

    var profileNameSub = userName[0].toUpperCase();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // -------------------- PROFILE HEADER --------------------
              SizedBox(
                height: topContainerHeight,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: SizedBox(
                        height: profilePhotoSize,
                        width: profilePhotoSize,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryColor.shade500,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                profileNameSub,
                                style: TextStyle(
                                    fontSize: profilePhotoSize / 2,
                                    color: whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      left: 175,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  profileName,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )),
                            Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  profileEmail,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                          ]),
                    ),
                  ],
                ),
              ),
              // -------------------- PROFILE ITEMS --------------------
              Column(
                children: const [
                  ProfileItem(
                    titleText: 'Info',
                    subtitleText: 'Check your personal info',
                    itemIcon: Icons.info_outline_rounded,
                  ),
                  ProfileItem(
                    titleText: 'Progress',
                    subtitleText: 'The topics you have learned',
                    itemIcon: Icons.show_chart_rounded,
                  ),
                ],
              ),
              CustomButton(onTap: _logOutButtonPressed, text: buttonText)
            ],
          ),
        ),
      ),
    );
  }

  _logOutButtonPressed() {
    return (() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignToSystemScreen()),
      );
    });
  }
}

class GoogleProfileScreen extends StatelessWidget {
  final GoogleSignInAccount user;
  const GoogleProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    late String profileEmail = user.email;
    const buttonText = 'Logout';

    dynamic userName = user.displayName ?? 'Draft';

    var profileNameSub = userName[0].toUpperCase();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // -------------------- PROFILE HEADER --------------------
              SizedBox(
                height: topContainerHeight,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: SizedBox(
                        height: profilePhotoSize,
                        width: profilePhotoSize,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryColor.shade500,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                profileNameSub,
                                style: TextStyle(
                                    fontSize: profilePhotoSize / 2,
                                    color: whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      left: 175,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    userName,
                                    style:
                                        Theme.of(context).textTheme.headlineSmall,
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  profileEmail,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                          ]),
                    ),
                  ],
                ),
              ),
              // -------------------- PROFILE ITEMS --------------------
              Column(
                children: const [
                  ProfileItem(
                    titleText: 'Info',
                    subtitleText: 'Check your personal info',
                    itemIcon: Icons.info_outline_rounded,
                  ),
                  ProfileItem(
                    titleText: 'Progress',
                    subtitleText: 'The topics you have learned',
                    itemIcon: Icons.show_chart_rounded,
                  ),
                ],
              ),
              CustomButton(
                  onTap: () {
                    // _accountDisconnect();
                    _logOutButtonPressed;
                  },
                  text: buttonText)
            ],
          ),
        ),
      ),
    );
  }

  Future _accountDisconnect() async {
    await GoogleSignInApi.logout();
  }

  _logOutButtonPressed(BuildContext context) { // TODO: Make button enabled
    return (() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignToSystemScreen()),
      );
    });
  }
}
