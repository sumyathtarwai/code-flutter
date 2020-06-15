import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'search_page.dart';

class WeatherHome extends StatefulWidget {
  final String title;
  const WeatherHome({Key key, @required this.title}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // date
    var dateSection = Text(
      'updated: ${DateFormat.Hm().format(
        DateTime.now(),
      )} - ${DateFormat.MMMd().format(
        DateTime.now(),
      )}',
      style: textTheme.subtitle1.copyWith(color: Colors.blueGrey),
    );
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(
          widget.title,
          style: textTheme.headline5,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search City',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => SearchPage(),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'YANGON',
                  style: textTheme.headline2.copyWith(
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            dateSection,
            Expanded(
              flex: 3,
              child: buildImage('assets/images/lc.png'),
            ),
            Expanded(
              child: Text(
                'Light Cloud',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.brown.shade600),
              ),
            ),
            Expanded(
              flex: 2,
              child: buildDegreeRow(current: '26℃', min: '32℃', max: '36℃'),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String url) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Image.asset(
        url,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildDegreeRow({
    @required String current,
    @required String min,
    @required String max,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          child: Text(
            current,
            style: GoogleFonts.ibmPlexMono(
              fontSize: 85,
              fontWeight: FontWeight.w400,
              color: Colors.brown,
            ),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'min $min',
                  style: GoogleFonts.ibmPlexMono(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Divider(),
              Container(
                child: Text(
                  'max max',
                  style: GoogleFonts.ibmPlexMono(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
