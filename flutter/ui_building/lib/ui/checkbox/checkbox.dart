import 'package:flutter/material.dart';

class CheckboxHome extends StatelessWidget {
  const CheckboxHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkbox Widgets အမျိုးအမျိုး',
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
                'Simple Checkbox',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/checkbox/simple');
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'CheckboxListTile',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/checkbox/tile');
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'Custom Checkbox [With Image]',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/checkbox/custom');
              },
            ),
          ],
        ),
      ),
    );
  }
}
