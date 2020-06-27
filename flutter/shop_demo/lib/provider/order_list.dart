import 'package:flutter/material.dart';
import 'modal.dart';

class OrderList with ChangeNotifier {
  // final String id;
//final String userId;
//final String storeId;
  static List<OrderItem> _order = [];

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

  void removeOrder({@required String orderId, @required String cartId}) {
    var i = _order.indexWhere((el) => el.id == orderId);

    if (i >= 0) {
      _order[i].removeOrderItem(cartId);

      if (_order[i].cart.isEmpty) {
        _order.removeAt(i);
      }
      notifyListeners();
    }
  }
}
