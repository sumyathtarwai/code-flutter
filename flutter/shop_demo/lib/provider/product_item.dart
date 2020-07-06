import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_item.g.dart';

enum Size {
  oversize,
  xl,
  l,
  m,
  s,
  xs,
  free,
  inch23,
  inch24,
  inch25,
  inch26,
  non,
}

enum ColorCode {
  white,
  black,
  gray,
  yellow,
  blue,
  pink,
  brown,
  red,
  non,
}

enum Gender {
  male,
  female,
  kid,
  unisex,
  non,
}

@JsonSerializable()
class ProductItem extends Equatable with ChangeNotifier {
  final String sku;
  final String id;
  final String title;
  final String desc;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool flag;
  final Size size;
  final List<ColorCode> color;
  final Gender gender;
  //TODO along with user
  bool isFavorite;
  final int displayQty;

  ProductItem(
      {this.id,
      this.sku,
      this.title,
      this.desc,
      this.price,
      this.imageUrl,
      this.categoryId,
      this.flag = false,
      this.size = Size.free,
      this.color,
      this.displayQty = 10,
      this.gender = Gender.non,
      this.isFavorite = false});

  ProductItem mapWithId(String id) => ProductItem(
        id: id,
        title: title,
        desc: desc,
        price: price,
        imageUrl: imageUrl,
        color: color,
        size: size,
        displayQty: displayQty,
        gender: gender,
        isFavorite: isFavorite,
        categoryId: categoryId,
      );

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);

  static Map<String, Object> getProductColor(ColorCode color) {
    var map;
    switch (color) {
      case ColorCode.white:
        map = {'name': 'White', 'color': Colors.white};
        break;
      case ColorCode.black:
        map = {'name': 'Black', 'color': Colors.black};
        break;
      case ColorCode.gray:
        map = {'name': 'Gray', 'color': Colors.grey};
        break;
      case ColorCode.yellow:
        map = {'name': 'Yellow', 'color': Colors.yellow};
        break;
      case ColorCode.blue:
        map = {'name': 'Blue', 'color': Colors.blue};
        break;
      case ColorCode.pink:
        map = {'name': 'Pink', 'color': Colors.pink};
        break;
      case ColorCode.brown:
        map = {'name': 'Brown', 'color': Colors.brown};
        break;
      case ColorCode.red:
        map = {'name': 'Red', 'color': Colors.red};
        break;
      case ColorCode.non:
      default:
        map = {'name': 'Non', 'color': Colors.white70};
    }
    return map;
  }

  String get sizeName {
    var size;
    switch (this.size) {
      case Size.oversize:
        size = 'Oversize';
        break;
      case Size.xl:
        size = 'XL';
        break;
      case Size.l:
        size = 'L';
        break;
      case Size.m:
        size = 'M';
        break;
      case Size.s:
        size = 'S';
        break;
      case Size.xs:
        size = 'XS';
        break;
      case Size.free:
        size = 'Free';
        break;
      case Size.inch23:
        size = '23 inch';
        break;
      case Size.inch24:
        size = '24 inch';
        break;
      case Size.inch25:
        size = '25 inch';
        break;
      case Size.inch26:
        size = '26 inch';
        break;
      default:
        size = 'Non';
    }
    return size;
  }

  @override
  List<Object> get props => [
        id,
        sku,
        title,
        desc,
        price,
        imageUrl,
        categoryId,
        flag,
        size,
        color,
        gender,
        isFavorite,
        displayQty
      ];

  @override
  bool get stringify => true;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  ProductItem copyWith({
    String id,
    String title,
    String desc,
    double price,
    String imageUrl,
    Size size,
    List<ColorCode> color,
    int displayQty,
    bool isFavorite,
  }) {
    return ProductItem(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      size: size ?? this.size,
      color: color ?? this.color,
      displayQty: displayQty ?? this.displayQty,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
