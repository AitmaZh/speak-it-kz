import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/src/features/auth/presentation/screens/sign_to_system_page.dart';
import 'package:speak_it_kz/src/shared/widgets/custom_buttons.dart';
import '../widgets/profile_items.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final topContainerHeight = 180.0;
  final profilePhotoSize = 120.0;

  @override
  Widget build(BuildContext context) {
    late String profileName = 'Surname';
    late String profileEmail = 'email@gmail.com';
    const buttonText = 'Login';

    var profileNameSub = profileName[0].toUpperCase();

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
                                  style: Theme.of(context).textTheme.titleMedium,
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
