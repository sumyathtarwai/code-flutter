import 'package:flutter/material.dart';
import 'package:form_ui/ui/home_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: FormHome(),
    );
  }
}
