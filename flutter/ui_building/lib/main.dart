import 'package:flutter/material.dart';
import 'package:ui_building/ui/alertbox/alertbox.dart';
import 'package:ui_building/ui/appbar/action_appbar.dart';
import 'package:ui_building/ui/appbar/appbar_home.dart';
import 'package:ui_building/ui/appbar/search_appbar.dart';
import 'package:ui_building/ui/appbar/simple_appbar.dart';
import 'package:ui_building/ui/buttons/buttons.dart';
import 'package:ui_building/ui/checkbox/checkbox.dart';
import 'package:ui_building/ui/checkbox/custom_checkbox.dart';
import 'package:ui_building/ui/checkbox/simple_checkbox.dart';
import 'package:ui_building/ui/checkbox/tile_checkbox.dart';
import 'package:ui_building/ui/input/input.dart';
import 'package:ui_building/ui/radio/custom_radio.dart';
import 'package:ui_building/ui/radio/radio.dart';
import 'package:ui_building/ui/radio/simple_radio.dart';
import 'package:ui_building/ui/radio/tile_radio.dart';
import 'package:ui_building/views/wallet_home.dart';
import 'package:ui_building/views/widgets_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        canvasColor: Colors.indigo.shade100,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WidgetsHome(),
        '/button': (context) => ButtonHome(),
        '/alert': (context) => AlertBoxHome(),
        '/radio': (context) => RadioButtonHome(),
        '/radio/simple': (context) => SimpleRadio(),
        '/radio/tile': (context) => TileRadio(),
        '/radio/custom': (context) => CustomRadio(),
        '/checkbox': (context) => CheckboxHome(),
        '/checkbox/simple': (context) => SimpleCheckbox(),
        '/checkbox/tile': (context) => TileCheckbox(),
        '/checkbox/custom': (context) => CustomCheckbox(),
        '/input': (context) => InputHome(),
        '/appbar': (context) => AppBarHome(),
        '/appbar/simple': (context) => SimpleAppbar(title: 'Goal'),
        '/appbar/action': (context) => ActionAppBar(title: 'Goal'),
        '/appbar/search': (context) => SearchAppBar(title: 'Goal'),
        '/wallet': (context) => WalletHome(),
      },
    );
  }
}
