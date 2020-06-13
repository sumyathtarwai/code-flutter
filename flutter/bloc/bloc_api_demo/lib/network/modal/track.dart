import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Track({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
