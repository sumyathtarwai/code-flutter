import 'package:book_moor/view/category/category_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Moor Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.deepOrange,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30.0,
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
          size: 30.0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoryHome(),
      },
    );
  }
}
