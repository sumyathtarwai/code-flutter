import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final int id;
  @JsonKey(name: 'weather_state_name')
  final String stateName;
  @JsonKey(name: 'weather_state_abbr')
  final String stateAbbr;
  final DateTime created;
  @JsonKey(name: 'min_temp')
  final double minTemp;
  @JsonKey(name: 'max_temp')
  final double maxTemp;
  @JsonKey(name: 'the_temp')
  final double temp;

  const Weather({
    this.id,
    this.stateName,
    this.stateAbbr,
    this.created,
    this.minTemp,
    this.maxTemp,
    this.temp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props =>
      [id, stateName, stateAbbr, created, minTemp, maxTemp, temp];

  @override
  bool get stringify => true;
}
