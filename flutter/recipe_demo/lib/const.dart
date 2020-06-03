import 'dart:ui';
import 'package:flutter/material.dart';
import './models/category.dart';

const Map<int, Color> defaultTheme = {
  50: Color.fromRGBO(150, 134, 255, .1),
  100: Color.fromRGBO(150, 134, 255, .2),
  200: Color.fromRGBO(150, 134, 255, .3),
  300: Color.fromRGBO(150, 134, 255, .4),
  400: Color.fromRGBO(150, 134, 255, .5),
  500: Color.fromRGBO(150, 134, 255, .6),
  600: Color.fromRGBO(150, 134, 255, .7),
  700: Color.fromRGBO(150, 134, 255, .8),
  800: Color.fromRGBO(150, 134, 255, .9),
  900: Color.fromRGBO(150, 134, 255, 1),
};
const btnColor = const Color.fromARGB(255, 93, 16, 73);
const fontName = 'Raleway';

//Color.fromRGBO(52, 73, 85, 1)
// Color.fromARGB(255, 3, 218, 197),
//Color.fromARGB(255, 233, 203, 190),

const dummyData = const [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'French',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Summer',
    color: Colors.teal,
  ),
];
