import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final int id;
  @JsonKey(name: 'weather_state_name')
  final String stateName;
  final String created;
  @JsonKey(name: 'min_temp')
  final double minTemp;
  @JsonKey(name: 'max_temp')
  final double maxTemp;
  @JsonKey(name: 'the_temp')
  final double temp;

  const Weather({
    this.id,
    this.stateName,
    this.created,
    this.minTemp,
    this.maxTemp,
    this.temp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [id, stateName, created, minTemp, maxTemp, temp];

  @override
  bool get stringify => true;
}
