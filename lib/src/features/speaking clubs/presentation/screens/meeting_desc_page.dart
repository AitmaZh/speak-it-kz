import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speak_it_kz/src/shared/widgets/custom_buttons.dart';

import '../../../../../assets/my_colors.dart';
import '../../../../../network_handler.dart';

class MeetingDescScreen extends StatefulWidget {
  dynamic meetingId;
  MeetingDescScreen({super.key, required this.meetingId});

  @override
  State<MeetingDescScreen> createState() => _MeetingDescScreenState();
}

class _MeetingDescScreenState extends State<MeetingDescScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  String defaultImage = 'lib/assets/img/announcement_default_image.jpg';

  fetchClubs() async {
    var url = '${networkHandler.baseUrl}/'; // TODO: Finish URL
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);

      // data.forEach((announcement) {
      //   // TODO: Finish
      //   setState(() {
      //     listItems.add(AnnouncementCard(
      //       meetingId: announcement[''],
      //       meetingTitle: announcement[''],
      //       desc: announcement[''],
      //       image: announcement[''],
      //       format: announcement[''],
      //       dateTime: announcement[''],
      //       organizatorId: announcement[''],
      //       prefLanguageLevel: announcement[''],
      //       entryFee: announcement[''],
      //     ));
      //   });
      // });
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
        title: Text(
          'Meeting Info',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(defaultImage)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        descText('Date: "date"'), // TODO: Format dateTime
                        descText('Time: "time"'),
                      ],
                    ),
                    descText('Format: "format"'),
                    descText('Address: "address", "city"'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: descText(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'),
                    ),
                    descText('Language Level: "prefLanguageLevel"'),
                    descText('Entry fee: "entryFee"'),
                    descText('Organizator: "organizator[name]"'),
                    descText('Contacts: "orgTel"'),
                  ]),
            ),
            CustomButton(onTap: enrollButtonPressed, text: 'Enroll'),
          ],
        ),
      ),
    );
  }

  enrollButtonPressed() {
    return (() {});
  }

  descText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          ),
    );
  }
}
