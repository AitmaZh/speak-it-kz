import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/network_handler.dart';

import 'organization_info_page.dart';

class EnrollConfirmationScreen extends StatefulWidget {
  dynamic id;

  EnrollConfirmationScreen({this.id});

  @override
  State<EnrollConfirmationScreen> createState() => _EnrollConfirmationScreenState();
}

class _EnrollConfirmationScreenState extends State<EnrollConfirmationScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    _toHistoryButtonPressed() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OrganizationInfoPage()));
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Icon(
                    Icons.emoji_emotions,
                    color: secondaryColor,
                    size: 125,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Thanks!', style: Theme.of(context).textTheme.displayMedium,),
                  ),
                  Text('You are sucessfully registered!', style: Theme.of(context).textTheme.titleLarge,),
                ],
              ),
            ),
          ),        
          ElevatedButton(onPressed: _toHistoryButtonPressed, child: Text('Go to history')),
          ],
      )),
    );
  }

  descText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
