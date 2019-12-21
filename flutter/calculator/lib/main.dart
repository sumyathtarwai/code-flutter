import 'package:flutter/material.dart';
import 'package:calculator/ui/calculator_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      home: CalculatorForm(),
    );
  }
}
