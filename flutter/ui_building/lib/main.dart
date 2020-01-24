import 'package:flutter/material.dart';
import 'package:ui_building/ui/alertbox/alertbox.dart';
import 'package:ui_building/ui/buttons/buttons.dart';
import 'package:ui_building/ui/radio/radio.dart';
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
        '/wallet': (context) => WalletHome(),
      },
    );
  }
}
