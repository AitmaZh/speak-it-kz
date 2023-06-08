import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

class ProfileItem extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final IconData itemIcon;

  const ProfileItem(
      {required this.titleText,
      required this.subtitleText,
      required this.itemIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric( vertical: 5, horizontal: 15),
      shadowColor: primaryColor.shade900,
      child: InkWell(
        onTap: _profileItemPressed,
        splashColor: secondaryColor.shade200,
        child: ListTile(
          leading: Icon(
            itemIcon,
            size: 29,
            color: primaryColor.shade500,
          ),
          title: Text(
            titleText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            subtitleText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          isThreeLine: false,
        ),
      ),
    );
  }

  _profileItemPressed() {
    return (() {});
  }
}
