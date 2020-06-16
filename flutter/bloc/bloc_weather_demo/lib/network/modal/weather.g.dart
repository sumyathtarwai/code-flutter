// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    id: json['id'] as int,
    stateName: json['weather_state_name'] as String,
    stateAbbr: json['weather_state_abbr'] as String,
    created: json['created'] as String,
    minTemp: (json['min_temp'] as num)?.toDouble(),
    maxTemp: (json['max_temp'] as num)?.toDouble(),
    temp: (json['the_temp'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.stateName,
      'weather_state_abbr': instance.stateAbbr,
      'created': instance.created,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.temp,
    };
