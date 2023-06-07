import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speak_it_kz/src/shared/widgets/custom_buttons.dart';

import '../../../../../assets/my_colors.dart';
import '../../../../../network_handler.dart';
import 'organization_info_page.dart';
 
class MeetingDescScreen extends StatefulWidget {
  dynamic meetingId;
  MeetingDescScreen({this.meetingId});

  @override
  State<MeetingDescScreen> createState() => _MeetingDescScreenState();
}

class _MeetingDescScreenState extends State<MeetingDescScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  String defaultImage = 'lib/assets/img/announcement_default_image.jpg';

  dynamic title;
  dynamic desc;
  dynamic format;
  dynamic dateTime;
  // dynamic organizatorName;
  dynamic entryFee;

  fetchMeetingInfo() async {
    var url = '${networkHandler.baseUrl}/announcements/${widget.meetingId}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      print(data);

      title = data['title'];
      desc = data['description'];
      format = data['format'];
      dateTime = data['date'];
      // organizatorName = data['title']; // TODO: Find org name
      entryFee = data['entryFee'];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMeetingInfo();
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
              CustomButton(onTap: enrollButtonPressed, text: 'Enroll'),
            ],
          ),
        ),
      ),
    );
  }

  enrollButtonPressed() {
    return (() {});
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

  _organizationLinkPressed() {
    return (() {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => OrganizationInfoPage(id: organizatorId)),
      // );
    });
  }
}
