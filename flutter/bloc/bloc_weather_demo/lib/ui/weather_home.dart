import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherHome extends StatefulWidget {
  final String title;
  const WeatherHome({Key key, @required this.title}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search City',
            onPressed: () => null,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Container(
              child: Center(
                child: Text(
                  'YANGON',
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      color: Colors.blue.shade800, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Updated at ${DateFormat.Hm().format(
                    DateTime.now(),
                  )} - ${DateFormat.yMMMd().format(
                    DateTime.now(),
                  )}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset(
                'assets/images/unknown.png',
                // fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
