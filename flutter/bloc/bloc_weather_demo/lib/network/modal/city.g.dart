// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    title: json['title'] as String,
    locationType: json['location_type'] as String,
    lattLong: json['latt_long'] as String,
    woeid: json['woeid'] as int,
    distance: json['distance'] as int,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'latt_long': instance.lattLong,
      'woeid': instance.woeid,
      'distance': instance.distance,
    };
