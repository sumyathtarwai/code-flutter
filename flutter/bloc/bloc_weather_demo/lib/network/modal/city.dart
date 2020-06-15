import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final String title;
  @JsonKey(name: 'location_type')
  final String locationType;
  @JsonKey(name: 'latt_long')
  final double lattLong;
  final int woeid;
  final int distance;

  City({
    this.title,
    this.locationType,
    this.lattLong,
    this.woeid,
    this.distance,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
