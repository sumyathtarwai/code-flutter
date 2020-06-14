import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text('Second Page'),
        ),
      ),
    );
  }
}
