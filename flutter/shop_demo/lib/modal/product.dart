import 'package:equatable/equatable.dart';

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

class Product extends Equatable {
  final String sku;
  final String id;
  final String title;
  final String desc;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool flag;
  final Size size;
  final ColorCode color;
  final Gender gender;

  const Product({
    this.id,
    this.sku,
    this.title,
    this.desc,
    this.price,
    this.imageUrl,
    this.categoryId,
    this.flag = false,
    this.size = Size.non,
    this.color = ColorCode.non,
    this.gender = Gender.non,
  });

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
}
