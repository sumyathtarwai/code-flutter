import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Bar Widgets အမျိုးအမျိုး',
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
                'Simple App Bar',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/appbar/simple');
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'App Bar [Action Icon + Subtitle]',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/appbar/action');
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'App Bar [Search, Text Field]',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/appbar/search');
              },
            ),
          ],
        ),
      ),
    );
  }
}
