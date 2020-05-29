import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

@JsonSerializable()
class Title {
  String rendered;

  Title({this.rendered});
  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
  Map<String, dynamic> toJson() => _$TitleToJson(this);
}
