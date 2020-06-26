import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Order extends Equatable with ChangeNotifier {
  final String id;
  final int cartId;
  final List<int> productId;
  final double total;
  final int qty;

  Order({
    this.id,
    this.cartId,
    this.productId,
    this.total,
    this.qty,
  });

  @override
  List<Object> get props => [id];
}
