import 'package:flutter/material.dart';

import 'pages/product_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductHome(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.red,
        accentColor: Colors.deepOrange,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
      ),
      darkTheme: ThemeData(
          fontFamily: 'Roboto',
          iconTheme: IconThemeData(
            color: Colors.redAccent,
          ),
          brightness: Brightness.dark),
    );
  }
}
