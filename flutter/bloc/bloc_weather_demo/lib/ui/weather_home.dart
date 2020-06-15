import 'package:bloc_weather_demo/bloc/weather_bloc.dart';
import '../network/modal/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'search_page.dart';

class WeatherHome extends StatefulWidget {
  final String title;

  WeatherHome({Key key, @required this.title}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  var locationId = 1015662;
  var currentCity;
  Weather report;
  //Completer _refreshCompleter;

  @override
  void initState() {
    // _refreshCompleter = Completer<void>();
    locationId = 1015662;
    currentCity = 'Yangon';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(
          widget.title,
          style: textTheme.headline5,
        ),
        actions: <Widget>[
          buildSearchButton(context),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (ctx, state) {
            if (state is WeatherInitial) {
              return CircularProgressIndicator();
            }

            if (state is WeatherLoaded) {
              return CircularProgressIndicator();
            }

            if (state is WeatherFail) {
              return Center(child: Text('Fail'));
            }

            if (state is WeatherLoaded) {
              var report = state.weatherReport?.weather?.first;
              return Column(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: cityTitle(textTheme, state.weatherReport?.title),
                    ),
                  ),
                  lastUpdate(textTheme),
                  Expanded(
                    flex: 3,
                    child:
                        weatherImage('assets/images/${report.stateAbbr}.png'),
                  ),
                  Expanded(
                    child: weatherCondition(context, '${report.stateName}'),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildDegreeRow(
                        current: '${report.temp}℃',
                        min: '${report.minTemp}℃',
                        max: '${report.maxTemp}℃'),
                  ),
                  Spacer(flex: 2),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Text weatherCondition(BuildContext context, String condition) {
    return Text(
      condition,
      style: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(color: Colors.brown.shade600),
    );
  }

  Text cityTitle(TextTheme textTheme, String title) {
    return Text(
      title,
      style: textTheme.headline2.copyWith(
        color: Colors.blue.shade800,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text lastUpdate(TextTheme textTheme) {
    return Text(
      'updated: ${DateFormat.Hm().format(
        DateTime.now(),
      )} - ${DateFormat.MMMd().format(
        DateTime.now(),
      )}',
      style: textTheme.subtitle1.copyWith(color: Colors.blueGrey),
    );
  }

  IconButton buildSearchButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      tooltip: 'Search City',
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => SearchPage(),
        ),
      ),
    );
  }

  Widget weatherImage(String url) {
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
