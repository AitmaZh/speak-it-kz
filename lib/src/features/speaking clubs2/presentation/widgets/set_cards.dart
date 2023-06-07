import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/src/features/flashcards/presentation/pages/flashcard_learn_page.dart';
import 'package:speak_it_kz/src/features/speaking%20clubs/presentation/screens/meeting_desc_page.dart';
import 'package:speak_it_kz/src/features/speaking%20clubs2/presentation/pages/meeting_desc_page2.dart';

class SetCard2 extends StatelessWidget {
  dynamic meetingTitle;
  dynamic format;
  dynamic dateTime;

  dynamic desc;
  dynamic image;
  dynamic address;
  dynamic city;
  dynamic organizatorId;
  dynamic prefLanguageLevel;
  dynamic entryFee;
  String defaultImage = 'lib/assets/img/announcement_default_image.jpg';
  DateTime defaultDateTime = DateTime.parse('2023-06-08 12:25:09.883522');

  SetCard2({required this.meetingTitle, required this.format, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    SetCard2Tapped() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  MeetingDescScreen2()));
    }
    

    // return Card(
    //   child: InkWell(
    //     splashColor: secondaryColor.shade200,
    //     onTap: SetCard2Tapped,
    //     child: SizedBox(
    //       width: 300,
    //       height: 150,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text('Card')
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Card(
      elevation: 0,
      color: transparentColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image(
              image: image ?? AssetImage(defaultImage),
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
                        meetingTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        address ?? format,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      // formatDateTime(defaultDateTime), // TODO: Format dateTime
                      'dateTime',
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
                      onPressed: SetCard2Tapped,
                      child: Text('More')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
