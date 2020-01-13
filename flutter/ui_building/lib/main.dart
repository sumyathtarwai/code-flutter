import 'package:flutter/material.dart';
import 'package:ui_building/ui/wallet/wallet_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal.shade700,
      ),
      home: WalletHome(),
    );
  }
}
