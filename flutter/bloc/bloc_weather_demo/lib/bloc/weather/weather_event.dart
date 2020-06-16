part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  final String cityName;

  const FetchWeather({@required this.cityName}) : assert(cityName != null);
  @override
  List<Object> get props => [cityName];
}
