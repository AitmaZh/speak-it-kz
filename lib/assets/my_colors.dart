import 'package:flutter/material.dart';

// NOTE: The argument type 'Color' can't be assigned to the parameter
//type 'MaterialColor?'.dart (argument_type_not_assignable)
MaterialColor primaryColor = MaterialColor(
  const Color.fromRGBO(19, 41, 61, 1).value,
  const <int, Color>{
    50: Color.fromRGBO(19, 41, 61, .1),
    100: Color.fromRGBO(19, 41, 61, .2),
    200: Color.fromRGBO(19, 41, 61, .3),
    300: Color.fromRGBO(19, 41, 61, .4),
    400: Color.fromRGBO(19, 41, 61, .5),
    500: Color.fromRGBO(19, 41, 61, .6),
    600: Color.fromRGBO(19, 41, 61, .7),
    700: Color.fromRGBO(19, 41, 61, .8),
    800: Color.fromRGBO(19, 41, 61, .9),
    900: Color.fromRGBO(19, 41, 61, 1),
  },
);

MaterialColor secondaryColor = MaterialColor(
  const Color.fromRGBO(76, 206, 172, 1).value,
  const <int, Color>{
    50: Color.fromRGBO(76, 206, 172, .1),
    100: Color.fromRGBO(76, 206, 172, .2),
    200: Color.fromRGBO(76, 206, 172, .3),
    300: Color.fromRGBO(76, 206, 172, .4),
    400: Color.fromRGBO(76, 206, 172, .5),
    500: Color.fromRGBO(76, 206, 172, .6),
    600: Color.fromRGBO(76, 206, 172, .7),
    700: Color.fromRGBO(76, 206, 172, .8),
    800: Color.fromRGBO(76, 206, 172, .9),
    900: Color.fromRGBO(76, 206, 172, 1),
  },
);

Color backgroundColor = const Color.fromRGBO(232, 241, 242, .3); // const Color.fromRGBO(232, 241, 242, 1)
Color transparentColor = const Color(0x00000000);
Color shadowColor = primaryColor.shade300;
Color whiteColor = Colors.white;

Color inactiveNavbarIconsColor = Colors.grey;

class ButtonColors {
  static Color overlayColor = secondaryColor;
  static Color elevatedButtonTextColor = whiteColor;

  static Color googleOverlayColor = whiteColor;
  static Color googleTextColor = Colors.black;
}

class IndicatorColors {
  static Color backgroundColor = primaryColor.shade50;
  static Color runningTimerColor = const Color.fromRGBO(45, 130, 183, 1);
  static Color pausedStatusColor = Colors.grey.shade400;
  static Color runningBreakColor = const Color.fromRGBO(156, 191, 167, 1);
}
