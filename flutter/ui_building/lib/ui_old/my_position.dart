import 'package:flutter/material.dart';

class MyPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            buildRow(),
            SizedBox(
              width: 20.0,
              height: 20.0,
            ),
            buildRow(),
            SizedBox(
              width: 20.0,
              height: 20.0,
            ),
            buildRow(),
            SizedBox(
              width: 20.0,
              height: 20.0,
            ),
            buildRow(),
          ],
        ));
  }

  Widget buildContainer({double width = 100.0, double height = 100.0}) {
    return Container(
      width: width,
      height: height,
      color: Colors.redAccent,
    );
  }

  Widget buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildContainer(),
        SizedBox(
          width: 20.0,
          height: 20.0,
        ),
        buildContainer(),
        SizedBox(
          width: 20.0,
          height: 20.0,
        ),
        buildContainer(),
      ],
    );
  }

  Widget buildColumn() {
    return Column(
      children: <Widget>[
        buildContainer(),
        Padding(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
        ),
        buildContainer(),
        Padding(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
        ),
        buildContainer(),
      ],
    );
  }
}
