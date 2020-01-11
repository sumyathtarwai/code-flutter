import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.only(
      topLeft: Radius.circular(
        100.0,
      ),
      bottomRight: Radius.circular(
        100.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          // color: Colors.blueAccent,
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade200,
              Colors.blueAccent,
            ],
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.green.shade100,
                offset: Offset(
                  0.0,
                  10.0,
                )),
          ],
          //borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            'Lorem ipsum dolor ',
            style: TextStyle(
              fontSize: 30.0,
              decoration: TextDecoration.underline,
              decorationColor: Colors.redAccent,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),
        ),
      ),
    );
  }
}
