import 'package:flutter/material.dart';

class FirstStateWidget extends StatefulWidget {
  @override
  _FirstStateWidgetState createState() => _FirstStateWidgetState();
}

class _FirstStateWidgetState extends State<FirstStateWidget> {
  var _count;
  @override
  void initState() {
    _count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.black,
      child: Center(
        child: InkWell(
          child: Text(
            'Hello $_count',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
          onTap: increment,
        ),
      ),
    );
  }

  increment() {
    setState(() {
      _count++;
    });
  }
}
