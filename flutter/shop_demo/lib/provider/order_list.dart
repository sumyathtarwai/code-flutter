import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_demo/provider/order_item.dart';

enum OrderStatus {
  waiting,
  confirm,
  shipping,
  pending,
  cancel,
  delivery,
  close,
}

class OrderList extends Equatable with ChangeNotifier {
  final String id;
  //final String orderId;
  final List<OrderItem> order;
//final String userId;
//final String storeId;
  final double total;
  final OrderStatus orderStatus;

  OrderList({this.id, this.order, this.total, this.orderStatus});

  String get orderName {
    var status;
    switch (this.orderStatus) {
      case OrderStatus.waiting:
        status = 'Waiting';
        break;
      case OrderStatus.confirm:
        status = 'Confirm';
        break;
      case OrderStatus.pending:
        status = 'Pending';
        break;
      case OrderStatus.shipping:
        status = 'Shipping';
        break;
      case OrderStatus.delivery:
        status = 'Delivered';
        break;
      case OrderStatus.cancel:
        status = 'Cancel';
        break;
      case OrderStatus.close:
        status = 'Close';
        break;
      default:
        status = 'Unknow';
    }
    return status;
  }

  @override
  // TODO: implement props
  List<Object> get props => [id];
}
