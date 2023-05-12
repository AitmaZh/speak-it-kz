import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const CustomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(3),
      child: ElevatedButton(
        onPressed: onTap(),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(ButtonColors.overlayColor),
        ),
        child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
    );
  }
}
