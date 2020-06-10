import 'dart:ui';

import 'package:flutter/material.dart';

// purple 150, 134, 255 //0xFF9686FF
const Map<int, Color> defaultTheme = {
  50: Color.fromRGBO(222, 232, 255, 1),
  100: Color.fromRGBO(212, 224, 252, 1),
  200: Color.fromRGBO(197, 214, 249, 1),
  300: Color.fromRGBO(194, 212, 249, 1),
  400: Color.fromRGBO(179, 202, 249, 1),
  500: Color.fromRGBO(182, 203, 249, 1),
  600: Color.fromRGBO(140, 174, 242, 1),
  700: Color.fromRGBO(140, 174, 242, 1),
  800: Color.fromRGBO(140, 174, 242, 1),
  900: Color.fromRGBO(150, 181, 247, 1),
};

const btnColor = const Color.fromARGB(255, 175, 170, 253);
const fontName = 'Raleway';
const appTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const MaterialColor themeColor = const MaterialColor(0xFFb6cbf9, defaultTheme);
final ThemeData themeData = ThemeData(
  primarySwatch: themeColor,
  accentColor: Color.fromARGB(255, 233, 203, 190),
  // canvasColor: themeColor.shade300,
  //Color.fromRGBO(232, 225, 225, 1),
  scaffoldBackgroundColor: themeColor.shade500,
  canvasColor: Color.fromARGB(60, 90, 83, 255),
  fontFamily: fontName,
  buttonColor: btnColor,
  iconTheme: IconThemeData(
    color: Colors.red,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
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
    caption: TextStyle(
     // fontSize: 22,
       fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    overline: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// route
const recipePagePath = '/recipes';
const recipesDetailPath = '/recipes/detail';
const favoritePath = '/recipes/favorite';
const filterPath = '/recipes/filter';
//Color.fromRGBO(52, 73, 85, 1) //grey
// Color.fromARGB(255, 3, 218, 197), //cyan
//Color.fromARGB(255, 233, 203, 190), //pink

const glutenText =
    'Strictly excludes gluten, which is a mixture of proteins found in wheat, as well as barley, rye, and oats.';
const veganText =
    ' Exclude all forms of animal exploitation and cruelty, vegans avoid traditional sources of protein and iron such as meat, poultry, fish and eggs.';
const vegetarianText =
    'Exclude meat and animal tissue products. Eggs and dairy products, such as milk and cheese without rennet are permitted.';
const lactoseText = 'Dairy products where the lactose has been removed, whereas dairy-free means there is no dairy at all, the food is made from plants or nuts instead.';