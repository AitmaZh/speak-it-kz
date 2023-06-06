import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/src/features/speaking%20clubs/presentation/screens/meeting_desc_page.dart';
import 'package:speak_it_kz/src/shared/widgets/custom_buttons.dart';

class AnnouncementCard extends StatefulWidget {
  dynamic meetingId;
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

  AnnouncementCard(
      {super.key,
      required this.meetingId,
      required this.meetingTitle,
      required this.desc,
      this.image,
      required this.format,
      required this.dateTime,
      this.address,
      this.city,
      required this.organizatorId,
      required this.prefLanguageLevel,
      required this.entryFee});

  @override
  State<AnnouncementCard> createState() => _AnnouncementCardState();
}

String formatDateTime(dynamic inputDateTime) {
  DateTime dateTimeToFormat = inputDateTime;
  String formattedDateTime = DateFormat('dd.MM / kk:mm')
      .format(dateTimeToFormat); //2023-06-06 03:27:09.883522

  return formattedDateTime;
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  String defaultImage = 'lib/assets/img/announcement_default_image.jpg';

  @override
  Widget build(BuildContext context) {
    moreButtonTapped() {
      return(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MeetingDescScreen(
                      meetingId: widget.meetingId,
                    )));
      });
    }

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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.meetingTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        widget.address ?? widget.format,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      formatDateTime(widget.dateTime),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                CustomButton(onTap: moreButtonTapped, text: 'More'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
