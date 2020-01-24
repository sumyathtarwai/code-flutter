import 'package:flutter/material.dart';
import 'package:ui_building/radio/radio.dart';
import 'buttons/buttons.dart';

import 'alertbox/alertbox.dart';
import 'views/wallet_home.dart';
import 'views/widgets_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WidgetsHome(),
        '/button': (context) => ButtonHome(),
        '/allert': (context) => AlertBoxHome(),
        '/radio': (context) => RadioButtonHome(),
        '/wallet': (context) => WalletHome(),
      },
    );
  }
}
