import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../assets/my_colors.dart';
import '../../../../../network_handler.dart';
import '../widgets/announcement_card.dart';
import 'meeting_desc_page.dart';

class SpeakingClubsCatalogScreen extends StatefulWidget {
  const SpeakingClubsCatalogScreen({super.key});

  @override
  State<SpeakingClubsCatalogScreen> createState() =>
      _SpeakingClubsCatalogScreenState();
}

class _SpeakingClubsCatalogScreenState
    extends State<SpeakingClubsCatalogScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  int groupValue = 0;
  List<AnnouncementCard> listItems = [];

  fetchClubs() async {
    var url = '${networkHandler.baseUrl}/announcements'; // TODO: Finish URL
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);

      data.forEach((announcement) {
        // TODO: Finish
        setState(() {
          listItems.add(AnnouncementCard(
            meetingId: announcement['id'],
            meetingTitle: announcement['title'],
            desc: announcement['description'],
            image: announcement[''],
            format: announcement['format'], // TODO: Implement dateTime
            organizatorId: announcement['organizationId'],
            prefLanguageLevel: 'B2',
            entryFee: announcement['entryFee'], 
          ));
        });
      });
    }
  }

  @override
  initState() {
    super.initState();
    fetchClubs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Speaking Clubs',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              customSegmentedControl(),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  children: listItems,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSegment(String text) => Container(
        padding: const EdgeInsets.all(2),
        child: Text(text),
      );

  Widget customSegmentedControl() => SizedBox(
      width: double.infinity,
      child: CupertinoSegmentedControl(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          groupValue: groupValue,
          children: {0: buildSegment('All'), 1: buildSegment('Enrolled')},
          onValueChanged: (groupValue) {
            print(groupValue);

            setState(() {
              this.groupValue = groupValue;
            });
          }),
    );
}
