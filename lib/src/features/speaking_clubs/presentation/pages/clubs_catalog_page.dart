import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/network_handler.dart';
import 'package:http/http.dart' as http;

import '../widgets/announcement_card.dart';

class ClubsCatalogScreen extends StatefulWidget {
  ClubsCatalogScreen({super.key});

  @override
  State<ClubsCatalogScreen> createState() => _ClubsCatalogScreenState();
}

class _ClubsCatalogScreenState extends State<ClubsCatalogScreen> {
  NetworkHandler networkHandler = NetworkHandler();


  List<AnnouncementCard> listItems = [
    AnnouncementCard(
      dateTime: null,
      format: 'ONLINE',
      meetingTitle: 'Free English Conversation',
    ),
    AnnouncementCard(
      dateTime: null,
      format: 'OFFLINE',
      meetingTitle: 'Speaking Club Weekend',
    ),
  ];

  fetchClubs() async {
    var url = '${networkHandler.baseUrl}/announcements';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);

      data.forEach((announcement) {
        setState(() {
          listItems.add(
            AnnouncementCard(
              dateTime: null,
              format: announcement['format'],
              meetingTitle: announcement['title'],
            ),
          );
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchClubs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Speaking Clubs',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: GridView.count(
            crossAxisCount: 1,
            children: listItems,
          ),
        ),
      ),
    );
  }
}
