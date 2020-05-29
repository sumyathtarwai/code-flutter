import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Page {
  int page;

  @JsonKey(name: 'per_page')
  int perPage;

  Page({this.page, this.perPage});

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}
