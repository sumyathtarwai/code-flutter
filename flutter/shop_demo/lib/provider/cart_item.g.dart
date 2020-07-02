// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    id: json['id'] as String,
    productId: json['productId'] as String,
    title: json['title'] as String,
    price: (json['price'] as num)?.toDouble(),
    qty: json['qty'] as int,
    color: _$enumDecodeNullable(_$ColorCodeEnumMap, json['color']),
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'title': instance.title,
      'price': instance.price,
      'color': _$ColorCodeEnumMap[instance.color],
      'qty': instance.qty,
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
