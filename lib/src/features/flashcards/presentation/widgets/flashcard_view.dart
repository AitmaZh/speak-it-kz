import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

class FlashcardView extends StatelessWidget {
  final String? text;

  const FlashcardView({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
