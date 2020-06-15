import 'package:bloc_weather_demo/bloc/weather_bloc.dart';
import 'package:bloc_weather_demo/ui/weather_home.dart';
import 'package:bloc_weather_demo/util/simple_bloc_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'network/api_service.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const titleText = 'Weather';
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (ctx) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (ctx, apiService, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                create: (ctx) => WeatherBloc(api: apiService),
              ),
            ],
            child: MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
                canvasColor: Colors.blue.shade50,
                primaryIconTheme: IconThemeData(color: Colors.blueGrey),
                textTheme: GoogleFonts.ralewayTextTheme(),
                brightness: Brightness.light,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              darkTheme: ThemeData(brightness: Brightness.dark),
              home: WeatherHome(title: titleText),
            ),
          );
        },
      ),
    );
  }
}
