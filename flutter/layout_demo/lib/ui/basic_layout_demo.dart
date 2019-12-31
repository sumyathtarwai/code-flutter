import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[100],
        body: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //verticalDirection: VerticalDirection.up,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildBox(
                text: 'box 1',
                color: Colors.amber,
              ),
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              _buildBox(
                text: 'box 2',
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              _buildBox(
                text: 'box3',
                color: Colors.greenAccent,
              ),
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              _buildBox(
                text: 'box4',
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox({String text, Color color, double width, double height}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _myBox(
          color,
          width,
          height,
          '1st $text',
        ),
        SizedBox(
          height: 10.0,
          width: 10.0,
        ),
        _myBox(
          color,
          width,
          height,
          '2nd $text',
        ),
        SizedBox(
          height: 10.0,
          width: 10.0,
        ),
        _myBox(
          color,
          width,
          height,
          '3rd $text',
        ),
        SizedBox(
          height: 10.0,
          width: 10.0,
        ),
        _myBox(
          color,
          width,
          height,
          '4th $text',
        ),
        SizedBox(
          height: 10.0,
          width: 10.0,
        ),
      ],
    );
  }

  Container _myBox(Color color, double width, double height, String text) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.all(6.5),
      padding: EdgeInsets.all(6),
      width: width ?? 80.0,
      height: height ?? 80.0,
      child: Text(text),
    );
  }
}
