// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return ProductItem(
    id: json['id'] as String,
    sku: json['sku'] as String,
    title: json['title'] as String,
    desc: json['desc'] as String,
    price: (json['price'] as num)?.toDouble(),
    imageUrl: json['imageUrl'] as String,
    categoryId: json['categoryId'] as String,
    flag: json['flag'] as bool,
    size: _$enumDecodeNullable(_$SizeEnumMap, json['size']),
    color: (json['color'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ColorCodeEnumMap, e))
        ?.toList(),
    displayQty: json['displayQty'] as int,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    isFavorite: json['isFavorite'] as bool,
  );
}

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'categoryId': instance.categoryId,
      'flag': instance.flag,
      'size': _$SizeEnumMap[instance.size],
      'color': instance.color?.map((e) => _$ColorCodeEnumMap[e])?.toList(),
      'gender': _$GenderEnumMap[instance.gender],
      'isFavorite': instance.isFavorite,
      'displayQty': instance.displayQty,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SizeEnumMap = {
  Size.oversize: 'oversize',
  Size.xl: 'xl',
  Size.l: 'l',
  Size.m: 'm',
  Size.s: 's',
  Size.xs: 'xs',
  Size.free: 'free',
  Size.inch23: 'inch23',
  Size.inch24: 'inch24',
  Size.inch25: 'inch25',
  Size.inch26: 'inch26',
  Size.non: 'non',
};

const _$ColorCodeEnumMap = {
  ColorCode.white: 'white',
  ColorCode.black: 'black',
  ColorCode.gray: 'gray',
  ColorCode.yellow: 'yellow',
  ColorCode.blue: 'blue',
  ColorCode.pink: 'pink',
  ColorCode.brown: 'brown',
  ColorCode.red: 'red',
  ColorCode.non: 'non',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.kid: 'kid',
  Gender.unisex: 'unisex',
  Gender.non: 'non',
};
