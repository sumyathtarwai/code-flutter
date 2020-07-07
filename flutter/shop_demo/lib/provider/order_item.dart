import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../provider/modal.dart';

part 'order_item.g.dart';

enum OrderStatus {
  waiting,
  confirm,
  shipping,
  pending,
  cancel,
  delivery,
  close,
}

@JsonSerializable()
class OrderItem extends Equatable with ChangeNotifier {
  final String id;
  final List<CartItem> orderItems;
  final DateTime createdDate;
  final double total;
  OrderStatus orderStatus;

  OrderItem({
    this.id,
    this.orderItems,
    this.total,
    this.createdDate,
    this.orderStatus = OrderStatus.waiting,
  });

  OrderItem copyWith({
    String id,
    List<CartItem> cart,
    double total,
    DateTime createdDate,
    OrderStatus orderStatus,
  }) {
    return OrderItem(
      id: id ?? this.id,
      orderItems: cart ?? this.orderItems,
      total: total ?? this.total,
      createdDate: createdDate ?? this.createdDate,
      orderStatus: orderStatus ?? this.orderStatus,
    );
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  void removeOrderItem(String cartId) {
    if (orderItems.isEmpty) return;

    var i = orderItems.indexWhere((el) => el.id == cartId);
    if (i >= 0) {
      orderItems.removeAt(i);
      notifyListeners();
    }
  }

  @override
  List<Object> get props => [id, orderItems, total, createdDate, orderStatus];

  String get statusName {
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
}
