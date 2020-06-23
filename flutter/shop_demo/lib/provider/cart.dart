import 'package:flutter/material.dart';
import '../provider/modal.dart';

class Cart with ChangeNotifier {
  final String id;
  final String productId;
  final String title;
  final double price;
  final ColorCode color;

  int qty;

  Cart({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.price,
    @required this.qty,
    @required this.color,
  });
}
