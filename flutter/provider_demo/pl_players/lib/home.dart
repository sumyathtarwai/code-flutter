import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/pl.png',
          color: Colors.white,
        ),
        titleSpacing: 30.0,
        title: Text('Premier League'),
      ),
      body: Container(),
    );
  }
}
