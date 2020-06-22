import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String id;
  final String productId;
  final String title;
  final double price;
  int qty;

  Cart({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.price,
    @required this.qty,
  });
}
