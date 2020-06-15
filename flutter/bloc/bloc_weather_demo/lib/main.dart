import 'package:bloc_weather_demo/ui/weather_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const titleText = 'Weather';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.blue.shade50,
        primaryIconTheme: IconThemeData(color: Colors.blueGrey),
        textTheme: GoogleFonts.ralewayTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherHome(title: titleText),
    );
  }
}
