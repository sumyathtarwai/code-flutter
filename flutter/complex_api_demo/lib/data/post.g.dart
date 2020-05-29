// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    slug: json['slug'] as String,
    status: json['status'] as String,
    title: json['title'] == null
        ? null
        : Title.fromJson(json['title'] as Map<String, dynamic>),
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    image: json['better_featured_image'] == null
        ? null
        : FeaturedImage.fromJson(
            json['better_featured_image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'slug': instance.slug,
      'status': instance.status,
      'title': instance.title,
      'content': instance.content,
      'better_featured_image': instance.image,
    };
