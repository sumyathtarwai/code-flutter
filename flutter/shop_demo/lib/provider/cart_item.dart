import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'modal.dart';

class CartItem extends Equatable with ChangeNotifier {
  final String id;
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

  double get subTotal {
    return this.price * this.qty;
  }

  @override
  List<String> get props => [id];
}
