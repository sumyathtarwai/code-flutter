import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City extends Equatable {
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

  @override
  List<Object> get props => [
        title,
        locationType,
        lattLong,
        woeid,
        distance,
      ];

  @override
  bool get stringify => true;
}
