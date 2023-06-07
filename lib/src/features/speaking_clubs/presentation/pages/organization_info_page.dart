import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

import '../widgets/announcement_card.dart';

class OrganizationInfoPage extends StatefulWidget {
  dynamic id;
  dynamic name = 'XPLORE';
  dynamic industry = 'Training Center';
  dynamic phone = '+7 777 777 7777';
  dynamic email = 'xplorebusiness@gmail.com';
  dynamic city = 'Astana';
  dynamic address = 'Saryarqa Avenue 28';

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        widget.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.industry,
                        style: TextStyle(color: primaryColor.shade600),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: transparentColor,
              ),
              titleText('Contacts'),
              descText('Phone: ${widget.phone}'),
              descText('Email: ${widget.email}'),
              const Divider(),
               titleText('Location'),
              descText('City: ${widget.city}'),
              descText('Address: ${widget.address}'),
              // TODO: Add desc & announcs
            ],
          ),
        ),
      ),
    );
  }

  descText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.left,
      ),
    );
  }

  titleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.left,
      ),
    );
  }
}
