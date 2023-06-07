import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

import '../widgets/announcement_card.dart';

class OrganizationInfoPage extends StatefulWidget {
  dynamic id;

  OrganizationInfoPage({super.key, this.id});

  @override
  State<OrganizationInfoPage> createState() => _OrganizationInfoPageState();
}

class _OrganizationInfoPageState extends State<OrganizationInfoPage> {
  List<AnnouncementCard> listItems = [
    AnnouncementCard(
      dateTime: null,
      format: 'ONLINE',
      meetingTitle: 'Free English Conversation',
    ),
  ];

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
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('XPLORE', style: Theme.of(context).textTheme.headlineSmall,),
              ),
              Text('Training Center', style: TextStyle(color: primaryColor.shade600),),
              Divider(color: transparentColor,),
              // TODO: Add desc & announcs
            ],
          ),
        ),
      ),
    );
  }
}
