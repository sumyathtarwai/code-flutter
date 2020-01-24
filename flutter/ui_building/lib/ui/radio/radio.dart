import 'package:flutter/material.dart';

class RadioButtonHome extends StatelessWidget {
  const RadioButtonHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Radio Buttons Widgets အမျိုးအမျိုး',
          style: TextStyle(
            fontFamily: "MyanmarNayone",
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            OutlineButton(
              child: Text(
                'Simple Radio',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/radio/simple');
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'RadioListTile',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/radio/tile');
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'Custom Radio [With Image]',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/radio/custom');
              },
            ),
          ],
        ),
      ),
    );
  }
}
