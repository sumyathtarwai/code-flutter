import 'package:flutter/material.dart';

import 'modal.dart';

class CartNotifier with ChangeNotifier {
  // int id;
  // String userId;

  CartNotifier();
//FIXME static variable ONLY for debug
  static final List<CartItem> _cartList = [];

  List<CartItem> get cartList {
    return [..._cartList];
  }

  void addToCart(CartItem cart) {
    var i = _cartList?.indexWhere((el) => cart.productId == el.productId);
    if (i >= 0) {
      _cartList[i].qty += cart.qty;
    } else {
      _cartList.add(cart);
    }
    notifyListeners();
  }

  void removeCart(CartItem cart) {
    if (cart != null) {
      // int i = _cartList.indexWhere((element) => cart.id == element.id);
      // _cartList.removeAt(i);
      // used Equatable
      _cartList.remove(cart);
      notifyListeners();
    }
  }

  int get totalQty {
    return _cartList.fold(
        0, (previousValue, element) => previousValue + element.qty);
  }

  double get total {
    return _cartList.fold(0, (prev, el) => prev + (el.price * el.qty));
  }
}
