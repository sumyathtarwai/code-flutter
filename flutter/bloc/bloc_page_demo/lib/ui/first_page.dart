import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text('First Page'),
        ),
      ),
    );
  }
}
