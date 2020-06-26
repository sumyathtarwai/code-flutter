import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_demo/provider/modal.dart';

class OrderItem extends Equatable with ChangeNotifier {
  final String id;
  final List<CartList> cart;
  //final int productId;
  final double price;
  final int qty;

  OrderItem({
    this.id,
    this.cart,
    //this.productId,
    this.price,
    this.qty,
  });

  @override
  List<Object> get props => [id];
}
