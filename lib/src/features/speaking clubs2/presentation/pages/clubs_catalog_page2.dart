import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/network_handler.dart';
import 'package:http/http.dart' as http;

import '../widgets/announcement_card2.dart';
import '../widgets/set_cards.dart';

class ClubsCatalogScreen2 extends StatefulWidget {
  ClubsCatalogScreen2({super.key});

  @override
  State<ClubsCatalogScreen2> createState() => _ClubsCatalogScreen2State();
}

class _ClubsCatalogScreen2State extends State<ClubsCatalogScreen2> {
  NetworkHandler networkHandler = NetworkHandler();

  List<SetCard2> gridItems = [
    SetCard2(dateTime: null, format: 'FORMATON', meetingTitle: 'TITLETITLE',),
  ];

  // fetchTopics() async {
  //   var url = '${networkHandler.baseUrl}/topics';
  //   var response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     var data = json.decode(response.body);

  //     data.forEach((topic) {
  //       setState(() {
  //         gridItems.add(SetCard(
  //             id: topic['id'],
  //             setName: topic['name'],
  //             setLevel: topic['level']));
  //       });
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // fetchTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Flashcards',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GridView.count(
            crossAxisCount: 1,
            children: gridItems,
          ),
        ),
      ),
    );
  }
}
