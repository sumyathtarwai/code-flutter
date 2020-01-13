import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 35.0,
          height: 30.0,
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 35.0,
          ),
        ),
        Positioned(
          right: 1.5,
          bottom: 42.0,
          child: Container(
            width: 15.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
      ],
    );
  }
}


