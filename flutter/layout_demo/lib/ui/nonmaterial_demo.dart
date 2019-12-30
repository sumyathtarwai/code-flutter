import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final _text;

  MyContainer(this._text);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.indigo[200]),
      child: Center(
          child: Text(
        '$_text',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
