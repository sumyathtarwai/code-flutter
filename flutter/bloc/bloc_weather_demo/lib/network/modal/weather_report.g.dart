// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherReport _$WeatherReportFromJson(Map<String, dynamic> json) {
  return WeatherReport(
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    locationType: json['location_type'] as String,
    woeid: json['woeid'] as int,
    lattLong: (json['latt_long'] as num)?.toDouble(),
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$WeatherReportToJson(WeatherReport instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
      'timezone': instance.timezone,
    };
