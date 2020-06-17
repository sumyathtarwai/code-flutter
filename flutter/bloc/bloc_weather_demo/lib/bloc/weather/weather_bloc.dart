import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_weather_demo/network/api_service.dart';
import 'package:bloc_weather_demo/network/modal/weather_report.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService api;

  WeatherBloc({@required this.api});
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      try {
        yield WeatherLoading();

        // final city = await api.getLocation(event.cityName);
        final report = await api.getWeather(event.woeid);

        yield WeatherLoaded(weatherReport: report);
      } catch (e) {
        yield WeatherFail(e);
      }
    }
  }
}
