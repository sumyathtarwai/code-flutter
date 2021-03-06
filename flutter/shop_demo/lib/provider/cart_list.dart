import 'package:flutter/material.dart';

import 'modal.dart';

class CartList with ChangeNotifier {
  // int id;
  // String userId;

//FIXME static variable ONLY for debug
  static List<CartItem> _cartList = [];

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

  void clearCart() {
    _cartList = [];
    notifyListeners();
  }

  int get totalQty {
    return _cartList.fold(
        0, (previousValue, element) => previousValue + element.qty);
  }

  double get total {
    return _cartList.fold(0, (prev, el) => prev + (el.price * el.qty));
  }

  void removeCurrent(String productId) {
    var i = _cartList.indexWhere((element) => element.productId == productId);
    if (i >= 0) {
      if (_cartList[i].qty > 1) {
        _cartList[i].qty--;
      } else {
        _cartList.removeAt(i);
      }
      notifyListeners();
    }
  }
}
