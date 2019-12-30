import 'package:flutter/material.dart';

class Lake extends StatelessWidget {
  static Color _color = Colors.blueAccent;

  final Widget lakeImage = Image.asset(
    'assets/lake.jpg',
    //width: 300,
    //height: 300,
    fit: BoxFit.cover,
  );
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
                padding: const EdgeInsets.only(bottom: 10),
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
            Icon(Icons.star, color: Colors.redAccent[700]),
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
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButton(Icons.phone, _color, 'CALL'),
        _buildButton(Icons.near_me, _color, 'ROUTE'),
        _buildButton(Icons.share, _color, 'SHARE'),
      ],
    ),
  );

  final Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[600],
          //title: Text('Layout Demo'),
        ),
        body: ListView(
          children: <Widget>[
            lakeImage,
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  static Column _buildButton(IconData icon, Color color, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
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
