import './weather.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_report.g.dart';

@JsonSerializable()
class WeatherReport extends Equatable {
  final List<Weather> weather;
  final String title;
  @JsonKey(name: 'location_type')
  final String locationType;
  final int woeid;
  @JsonKey(name: 'latt_long')
  final double lattLong;
  final String timezone;

  const WeatherReport({
    this.weather,
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
    this.timezone,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportToJson(this);

  @override
  List<Object> get props =>
      [weather, title, locationType, woeid, lattLong, timezone];
  @override
  bool get stringify => true;
}
