part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  final int woeid;

  FetchWeather({@required this.woeid}) : assert(woeid != null);
  @override
  List<Object> get props => [woeid];
}
