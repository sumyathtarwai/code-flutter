// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    page: json['page'] as int,
    perPage: json['per_page'] as int,
  );
}

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
    };
