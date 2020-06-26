import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
      this.size = Size.non,
      this.color,
      this.displayQty = 10,
      this.gender = Gender.non,
      this.isFavorite = false});

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
  List<Object> get props => [id];

  @override
  bool get stringify => true;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
