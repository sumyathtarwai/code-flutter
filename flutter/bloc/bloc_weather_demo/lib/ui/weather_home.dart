import 'package:flutter/services.dart';

import '../bloc/weather/weather_bloc.dart';
import '../network/modal/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'search_page.dart';

class WeatherHome extends StatefulWidget {
  WeatherHome({Key key}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  static const titleText = 'Weather';
  String currentCity;
  Weather report;
  //Completer _refreshCompleter;

  @override
  void initState() {
    // _refreshCompleter = Completer<void>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(
          titleText,
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
              BlocProvider.of<WeatherBloc>(context)
                  .add(FetchWeather(cityName: currentCity ?? 'Yangon'));
              return Center(child: Text('Please Select a Location'));
            }

            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is WeatherFail) {
              return Center(child: Text('Fail to fetch weather'));
            }

            if (state is WeatherLoaded) {
              var report = state.weatherReport?.weather?.first;
              return Column(
                children: <Widget>[
                  const Spacer(),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: cityTitle(
                          textTheme, currentCity = state.weatherReport?.title),
                    ),
                  ),
                  lastUpdate(textTheme, DateTime.now()),
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
                      current: '${report.temp.toStringAsFixed(0)}℃',
                      min: '${report.minTemp.toStringAsFixed(0)}℃',
                      max: '${report.maxTemp.toStringAsFixed(0)}℃',
                    ),
                  ),
                  const Spacer(flex: 2),
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

  Text lastUpdate(TextTheme textTheme, DateTime date) {
    return Text(
      'updated: ${DateFormat.jm().format(date)}',
      style: GoogleFonts.ibmPlexMono(color: Colors.blueGrey),
    );
  }

  IconButton buildSearchButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      tooltip: 'Search City',
      onPressed: () async {
        var pop = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => SearchPage(city: currentCity),
          ),
        );
        if (pop == null) return;
        BlocProvider.of<WeatherBloc>(context).add(FetchWeather(cityName: pop));
      },
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
        Column(
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
                'max $max',
                style: GoogleFonts.ibmPlexMono(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
