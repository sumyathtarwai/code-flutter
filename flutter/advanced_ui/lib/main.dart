//import 'package:advanced_ui/ui/my_decoration.dart';
import 'package:advanced_ui/ui/my_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: MyHome(),
        //MyDecoration(),
      ),
    );
  }
}
