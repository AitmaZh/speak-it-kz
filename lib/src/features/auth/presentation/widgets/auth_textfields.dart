import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

class AuthTextFormField extends StatefulWidget {
  final TextEditingController textEditController;
  final String labelText;
  late bool isObscured;
  void Function(String) onChanged;
  String? Function(String?) customValidator;

  AuthTextFormField({
    required this.textEditController,
    required this.labelText,
    required this.isObscured,
    required this.onChanged,
    required this.customValidator
  });

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  late IconButton suffixIcon;

  @override
  Widget build(BuildContext context) {
    // Defines the visibility of the suffix icons
    if (widget.labelText == 'Password' ||
        widget.labelText == 'Repeat password') {
      suffixIcon = IconButton(
          onPressed: () {
            setState(() {
              widget.isObscured = !widget.isObscured;
            });
          },
          icon: Icon(
              widget.isObscured ? Icons.visibility_off : Icons.visibility));
    } else {
      suffixIcon = IconButton(
        onPressed: null,
        icon: Icon(widget.isObscured ? Icons.visibility_off : Icons.visibility),
        disabledColor: transparentColor,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
        obscureText: widget.isObscured,
        style: Theme.of(context).textTheme.bodyLarge,
        controller: widget.textEditController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          suffixIcon: suffixIcon,
        ),
        validator: widget.customValidator,
        onChanged: widget.onChanged,
      ),
    );
  }
}
