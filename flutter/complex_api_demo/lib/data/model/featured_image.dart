import 'package:json_annotation/json_annotation.dart';

part 'featured_image.g.dart';

@JsonSerializable()
class FeaturedImage {
  //alt_text
  // source_url
  int id;
  @JsonKey(name: "alt_text")
  String altText;

  @JsonKey(name: "source_url")
  String sourceUrl;
  FeaturedImage({this.id, this.altText, this.sourceUrl});
  factory FeaturedImage.fromJson(Map<String, dynamic> json) =>
      _$FeaturedImageFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedImageToJson(this);
}
