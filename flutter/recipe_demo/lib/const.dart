import 'dart:ui';

import 'package:flutter/material.dart';

// purple 150, 134, 255 //0xFF9686FF
const Map<int, Color> defaultTheme = {
  50: Color.fromRGBO(68, 44, 46, .1),
  100: Color.fromRGBO(68, 44, 46, .2),
  200: Color.fromRGBO(68, 44, 46, .3),
  300: Color.fromRGBO(68, 44, 46, .4),
  400: Color.fromRGBO(68, 44, 46, .5),
  500: Color.fromRGBO(68, 44, 46, .6),
  600: Color.fromRGBO(68, 44, 46, .7),
  700: Color.fromRGBO(68, 44, 46, .8),
  800: Color.fromRGBO(68, 44, 46, .9),
  900: Color.fromRGBO(68, 44, 46, 1),
};
const btnColor = const Color.fromARGB(255, 93, 16, 73);
const fontName = 'Raleway';
const appTextStyle = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const MaterialColor themeColor = const MaterialColor(0xFF442c2e, defaultTheme);
final ThemeData themeData = ThemeData(
  primarySwatch: themeColor,
  accentColor: Color.fromARGB(255, 3, 218, 197),
  canvasColor: Color.fromRGBO(232, 225, 225, 1),
  //themeColor.shade300,
  fontFamily: fontName,
  buttonColor: btnColor,
  textTheme: TextTheme(
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// route
const categoriesDetailPath = '/categories/detail';
//Color.fromRGBO(52, 73, 85, 1) //grey
// Color.fromARGB(255, 3, 218, 197), //cyan
//Color.fromARGB(255, 233, 203, 190), //pink
