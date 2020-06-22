import 'package:flutter/material.dart';

import 'modal.dart';

class CartNotifier with ChangeNotifier {
  int id;
  // String userId;

  List<Cart> _cartList = [];

  List<Cart> get cartList {
    return [..._cartList];
  }

  void addToCart(Cart cart) {
    var i = _cartList?.indexWhere((el) => cart.productId == el.productId);
    if (i >= 0) {
      _cartList[i].qty += cart.qty;
    } else {
      _cartList.add(cart);
    }
    notifyListeners();
  }

  int get totalQty {
    return _cartList.fold(
        0, (previousValue, element) => previousValue + element.qty);
  }

  double get total {
    return _cartList.fold(0, (prev, el) => prev + el.price);
  }
}
