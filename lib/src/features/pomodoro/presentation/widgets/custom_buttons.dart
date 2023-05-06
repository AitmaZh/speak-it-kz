import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const CustomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        overlayColor: MaterialStateProperty.all<Color>(ButtonColors.overlayColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
