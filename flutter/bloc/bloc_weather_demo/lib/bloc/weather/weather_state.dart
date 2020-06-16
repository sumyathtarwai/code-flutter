part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherReport weatherReport;
  const WeatherLoaded({@required this.weatherReport})
      : assert(weatherReport != null);
  @override
  List<Object> get props => [weatherReport];
}

class WeatherFail extends WeatherState {
  final Object ex;
  const WeatherFail(this.ex);
}
