import 'package:flutter/material.dart';

import '../../../../../assets/my_colors.dart';

class ProgressIcons extends StatelessWidget {
  final int total;
  final int done;

  const ProgressIcons({required this.total, required this.done});

  @override
  Widget build(BuildContext context) {
    const iconSize = 35.0;

    List<Icon> icons = [];

    final doneIcon = Icon(
      Icons.check_circle_rounded,
      color: secondaryColor,
      size: iconSize,
    );

    final notDoneIcon = Icon(
      Icons.check_circle_outline_rounded,
      color: IndicatorColors.backgroundColor,
      size: iconSize,
    );

    for (int i = 0; i < total; i++) {
      if (i < done) {
        icons.add(doneIcon);
      } else {
        icons.add(notDoneIcon);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: icons,
      ),
    );
  }
}
