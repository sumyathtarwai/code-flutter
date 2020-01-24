import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyHome'),
      ),
      body: Container(
        width: 300.0,
        height: 300.0,
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            buildCard(
              Colors.green,
              100.0,
              100.0,
            ),
            buildCard(
              Colors.yellow,
              50.0,
              50.0,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: buildCard(
                Colors.cyan,
                50.0,
                50.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Card buildCard(Color color, double width, double height) {
    return Card(
      //margin: EdgeInsets.all(10.0),
      color: color,
      elevation: 5.0,
      child: Container(
        width: width,
        height: height,
      ),
    );
  }
}
