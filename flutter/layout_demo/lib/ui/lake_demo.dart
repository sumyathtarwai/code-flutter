import 'package:flutter/material.dart';

class Lake extends StatelessWidget {
  static Color _color = Colors.blueAccent;
  final Widget titleSection = Container(
    color: Colors.lime,
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Oeschinen Lake Campground'),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Icon(Icons.star, color: Colors.red[800]),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              '41',
              style: TextStyle(),
            ),
          ],
        ),
      ],
    ),
  );

  final Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButton(Icons.phone, _color, 'CALL'),
        _buildButton(Icons.near_me, _color, 'ROUTE'),
        _buildButton(Icons.share, _color, 'SHARE'),
      ],
    ),
  );

//final Widget textSection =
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[titleSection, buttonSection],
    );
  }

  static Column _buildButton(IconData icon, Color color, String label) {
    return Column(
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}
