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

  Future<List<OrderItem>> fetchOrders() async {
    try {
      Map<String, OrderItem> response = await _api.getOrders();

      final data = response?.entries?.map((e) {
        // firebase return [x] = null, when sub child is deleted
        if (e.value.orderItems != null) {
          e.value.orderItems.removeWhere((el) => el == null);
        }
        return e.value.copyWith(id: e.key);
      })?.toList();

      _order.clear();
      _order.addAll(data);
      notifyListeners();
      return data;
    } catch (e) {
      switch (e.runtimeType) {
        case DioError:
          throw NetworkException(e);
          break;
        default:
      }
    }
    return null;
  }

  Future<void> addOrder(List<CartItem> carts, double total) async {
    final date = DateTime.now();
    try {
      final orders = OrderItem(
        orderItems: carts,
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

  Future<void> removeOrder(
      {@required String orderId, @required String cartId}) async {
    var i = _order.indexWhere((el) => el.id == orderId);

    if (i >= 0) {
      // get all order items

      // [/orders/{id}/orderItems.json] has null
      // var orderItems = await _api.getOrderItemsById(orderId);

      var orders = await _api.getAllOrderById(orderId);
      var orderItems = orders.orderItems;

      // search id of index
      var index = orderItems.indexWhere((el) {
        if (el != null) {
          return el.id == cartId;
        }
        return false;
      });
      try {
        if (index >= 0) {
          await _api.deleteOrderByItemId(orderId, index);

          // remove only cart
          _order[i].removeOrderItem(cartId);
          // if no cart left remove all order id
          if (_order[i].orderItems.isEmpty ) {
            _order.removeAt(i);
            await _api.deleteOrderById(orderId);
          }
          notifyListeners();
        }
      } catch (e) {
        switch (e.runtimeType) {
          case DioError:
            throw NetworkException(e);
            break;
          default:
        }
      }
    }
  }
}
