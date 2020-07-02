import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'modal.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem extends Equatable with ChangeNotifier {
  final String id;
  // should use Product?
  final String productId;
  final String title;
  final double price;
  final ColorCode color;
  int qty;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.price,
    @required this.qty,
    @required this.color,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  double get subTotal {
    return this.price * this.qty;
  }

  @override
  List<String> get props => [id];
}
