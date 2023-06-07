import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:speak_it_kz/network_handler.dart';
import '../widgets/flashcard_view.dart';
import 'package:http/http.dart' as http;

import 'organization_info_page.dart';

class EnrollConfirmationScreen extends StatefulWidget {
  dynamic id;

  EnrollConfirmationScreen({this.id});

  @override
  State<EnrollConfirmationScreen> createState() => _EnrollConfirmationScreenState();
}

class _EnrollConfirmationScreenState extends State<EnrollConfirmationScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  dynamic title = 'title';
  dynamic desc = 'desc';
  dynamic format = 'format';
  dynamic dateTime = 'date';
  // dynamic organizatorName;
  dynamic entryFee = 'entryFee';
  String defaultImage = 'lib/assets/img/announcement_default_image.jpg';

  // fetchDefinitions() async {
  //   var url = '${networkHandler.baseUrl}/topics/definitions/${widget.id}';
  //   var response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     flashcards.removeAt(0);

  //     var data = json.decode(response.body);

  //     data.forEach((definition) {
  //       setState(() {
  //         flashcards.add(Flashcard(
  //             word: definition['word'], definition: definition['description']));
  //       });
  //     });
  //     flashcards.removeAt(0);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // fetchDefinitions();
  }

  @override
  Widget build(BuildContext context) {
    //   _organizationLinkPressed() {
    //   return (() {
    //     // Navigator.push(
    //     //   context,
    //     //   MaterialPageRoute(
    //     //       builder: (context) => OrganizationInfoPage(id: organizatorId)),
    //     // );
    //   });
    // }

    _organizationLinkPressed() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OrganizationInfoPage()));
    }

    _enrollButtonPressed() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OrganizationInfoPage()));
    }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(defaultImage)),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: descText(desc),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          descText('Date: "date"'), // TODO: Format dateTime
                          descText('Time: "time"'),
                        ],
                      ),
                      descText('Format: $format'),
                      descText('Address: "address", "city"'),
                      descText('Entry fee: $entryFee'),
                      const Divider(),
                      InkWell(
                        onTap: _organizationLinkPressed,
                        child: Text(
                          'link',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: secondaryColor),
                        ),
                        splashColor: secondaryColor,
                      ),
                      // descText('Contacts: "orgTel"'),
                    ]),
              ),
              ElevatedButton(
                  onPressed: _enrollButtonPressed, child: Text('Enroll')),
            ],
          ),
        ),
      ),
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
