import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/src/features/speaking%20clubs/presentation/screens/meeting_desc_page.dart';
import 'package:speak_it_kz/src/shared/widgets/custom_buttons.dart';

class AnnouncementCard2 extends StatefulWidget {
  final String meetingId;
  dynamic meetingTitle;
  dynamic desc;
  dynamic image;
  dynamic format;
  dynamic dateTime;
  dynamic address;
  dynamic city;
  dynamic organizatorId;
  dynamic prefLanguageLevel;
  dynamic entryFee;

  AnnouncementCard2(
      {super.key,
      required this.meetingId,
      required this.meetingTitle,
      required this.desc,
      this.image,
      required this.format,
      this.dateTime,
      this.address,
      this.city,
      required this.organizatorId,
      required this.prefLanguageLevel,
      required this.entryFee});

  @override
  State<AnnouncementCard2> createState() => _AnnouncementCard2State();
}

String formatDateTime(dynamic inputDateTime) {
  DateTime dateTimeToFormat = inputDateTime;
  String formattedDateTime = DateFormat('dd.MM / kk:mm')
      .format(dateTimeToFormat); //2023-06-06 03:27:09.883522

  return formattedDateTime;
}

class _AnnouncementCard2State extends State<AnnouncementCard2> {
  String defaultImage = 'lib/assets/img/announcement_default_image.jpg';
  DateTime defaultDateTime = DateTime.parse('2023-06-08 12:25:09.883522');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: transparentColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image(
              image: widget.image ?? AssetImage(defaultImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.meetingTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        widget.address ?? widget.format,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      formatDateTime(defaultDateTime), // TODO: Format dateTime

                      textAlign: TextAlign.start,
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            ButtonColors.overlayColor),
                      ),
                      onPressed: navigateToDesc,
                      child: Text('More')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  navigateToDesc() {
    return (() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MeetingDescScreen()),
      );
    });
  }
}
