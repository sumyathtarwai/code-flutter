import 'package:flutter/material.dart';
import 'modal.dart';

class OrderList with ChangeNotifier {
  // final String id;
//final String userId;
//final String storeId;
  final List<OrderItem> _order = [];

  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(List<CartItem> carts, double total) {
    _order.add(
      OrderItem(
        id: DateTime.now().toString(),
        cart: carts,
        total: total,
        createdDate: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
