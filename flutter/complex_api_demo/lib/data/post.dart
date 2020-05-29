import 'package:complex_api_demo/data/model/content.dart';
import 'package:complex_api_demo/data/model/featured_image.dart';
import 'package:complex_api_demo/data/model/title.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
// id
  int id;
// date
  DateTime date;
// slug
  String slug;
// status
  String status;
// title
  Title title;
// content
  Content content;
// image model
  @JsonKey(name: 'better_featured_image')
  FeaturedImage image;

  Post(
      {this.id,
      this.date,
      this.slug,
      this.status,
      this.title,
      this.content,
      this.image});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
