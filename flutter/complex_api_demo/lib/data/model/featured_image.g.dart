// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedImage _$FeaturedImageFromJson(Map<String, dynamic> json) {
  return FeaturedImage(
    id: json['id'] as int,
    altText: json['alt_text'] as String,
    sourceUrl: json['source_url'] as String,
  );
}

Map<String, dynamic> _$FeaturedImageToJson(FeaturedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alt_text': instance.altText,
      'source_url': instance.sourceUrl,
    };
