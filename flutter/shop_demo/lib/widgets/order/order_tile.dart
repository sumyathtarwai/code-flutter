import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../provider/modal.dart';

class OrderTile extends StatefulWidget {
  final OrderItem order;
  const OrderTile({Key key, @required this.order}) : super(key: key);

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  var _expand = false;
  @override
  Widget build(BuildContext context) {
    var date = DateFormat('dd/MM/yyyy').format(widget.order.createdDate);
    return Column(
      children: <Widget>[
        if (widget.order.orderItems.isNotEmpty)
          Card(
            color: Theme.of(context).primaryColorLight,
            child: ListTile(
              leading: Text('${widget.order.statusName}'),
              title: Text('\S${(widget.order.total).toStringAsFixed(2)}'),
              subtitle: Text(date),
              trailing: IconButton(
                icon: Icon(_expand ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expand = !_expand;
                  });
                },
              ),
            ),
          ),
        if (_expand)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: min(widget.order.orderItems.length * 20.0 + 60, 220.0),
            child: ChangeNotifierProvider<OrderItem>.value(
              value: widget.order,
              builder: (context, child) => Consumer<OrderItem>(
                builder: (context, value, child) =>
                    OrderDetailDrawer(order: widget.order),
              ),
            ),
          ),
      ],
    );
  }
}

class OrderDetailDrawer extends StatefulWidget {
  const OrderDetailDrawer({Key key, @required this.order}) : super(key: key);

  final OrderItem order;

  @override
  _OrderDetailDrawerState createState() => _OrderDetailDrawerState();
}

class _OrderDetailDrawerState extends State<OrderDetailDrawer> {
  var _isloading = false;
  @override
  Widget build(BuildContext context) {
    var date = DateFormat('dd/MM/yyyy').format(widget.order.createdDate);
    var orderOf = Provider.of<OrderList>(context, listen: false);

    return ListView.builder(
      itemBuilder: (context, i) {
        var cart = widget.order.orderItems[i];
        return Card(
          color: Theme.of(context).secondaryHeaderColor,
          child: ListTile(
            leading: Chip(
              label: Text(
                '\$ ${(cart.price * cart.qty).toStringAsFixed(2)}',
              ),
            ),
            title: Text(cart.title),
            subtitle: Text(
              '\$ ${cart.price} * ${cart.qty}x \n$date',
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: _isloading
                    ? null
                    : () async {
                        _loading(true);
                        await orderOf.removeOrder(
                            orderId: widget.order.id, cartId: cart.id);
                        _loading(false);
                      }),
          ),
        );
      },
      itemCount: widget.order.orderItems.length,
    );
  }

  void _loading(bool val) {
    setState(() {
      _isloading = val;
    });
  }
}
