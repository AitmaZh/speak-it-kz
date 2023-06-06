import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

class GoogleAuthButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const GoogleAuthButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    const iconSize = 24.0;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(3),
      child: ElevatedButton.icon(
        onPressed: onTap(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(whiteColor),
          overlayColor:
              MaterialStateProperty.all<Color>(ButtonColors.overlayColor),
        ),
        icon: Image.asset(
          'lib/assets/img/google_logo.ico',
          height: iconSize,
          width: iconSize,
        ), // TODO: Add icon
        label: Text(
          text,
          style: TextStyle(color: ButtonColors.googleTextColor, fontSize: 16),
        ),
      ),
    );
  }
}
