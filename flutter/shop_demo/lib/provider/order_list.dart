import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import '../exception/network_exception.dart';
import '../network/rest_client.dart';
import '../service_locator.dart';
import 'modal.dart';

class OrderList with ChangeNotifier {
  // final String id;
//final String userId;
//final String storeId;
  final List<OrderItem> _order = [];
  // Inject  Api
  final RestClient _api = locator<RestClient>();

  List<OrderItem> get order {
    return [..._order];
  }

  Future<void> addOrder(List<CartItem> carts, double total) async {
    final date = DateTime.now();
    try {
      final orders = OrderItem(
        cart: carts,
        total: total,
        createdDate: date,
      );
      HttpResponse res = await _api.addOrder(orders);
      final id = res.data["name"];
      _order.insert(0, orders.copyWith(id: id));
      notifyListeners();
    } catch (e) {
      switch (e.runtimeType) {
        case DioError:
          throw NetworkException(e);
          break;
        default:
      }
    }
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
