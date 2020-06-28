import 'package:flutter/material.dart';

class ColorNonIcon extends StatelessWidget {
  const ColorNonIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: 20,
      height: 20,
      child: Icon(
        Icons.close,
        color: Colors.red,
        size: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
