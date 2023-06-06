import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../assets/my_colors.dart';
import '../../../../../network_handler.dart';
import '../widgets/announcement_card.dart';

class SpeakingClubsCatalogScreen extends StatefulWidget {
  const SpeakingClubsCatalogScreen({super.key});

  @override
  State<SpeakingClubsCatalogScreen> createState() =>
      _SpeakingClubsCatalogScreenState();
}

DateTime defaultDateTime = DateTime.parse('2023-06-08 12:25:09.883522');

class _SpeakingClubsCatalogScreenState
    extends State<SpeakingClubsCatalogScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  int groupValue = 0;
  List<AnnouncementCard> listItems = [
    AnnouncementCard(
      meetingId: 'BSC Speaking Club',
      meetingTitle: 'BSC Speaking Club',
      desc: 'Улы Дала 29',
      address: 'Улы Дала 29',
      format: 'оффлайн',
      dateTime: defaultDateTime,
      organizatorId: 'Lorem Insum',
      prefLanguageLevel: 'Lorem Insum',
      entryFee: 'Lorem Insum',
    ),
    AnnouncementCard(
      meetingId: 'Game Night',
      meetingTitle: 'Game Night',
      desc: 'онлайн',
      format: 'онлайн',
      dateTime: defaultDateTime,
      organizatorId: 'Lorem Insum',
      prefLanguageLevel: 'Lorem Insum',
      entryFee: 'Lorem Insum',
    ),
    AnnouncementCard(
      meetingId: 'Lorem Insum',
      meetingTitle: 'Lorem Insum',
      desc: '',
      address: 'Петрова 18',
      format: 'оффлайн',
      dateTime: defaultDateTime,
      organizatorId: 'Lorem Insum',
      prefLanguageLevel: 'Lorem Insum',
      entryFee: 'Lorem Insum',
    ),
  ];

  fetchClubs() async {
    // var url = '${networkHandler.baseUrl}/'; // TODO: Finish URL
    // var response = await http.get(Uri.parse(url));
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   var data = json.decode(response.body);

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
    // }
  }

  @override
  initState() {
    super.initState();
    // fetchClubs();
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
