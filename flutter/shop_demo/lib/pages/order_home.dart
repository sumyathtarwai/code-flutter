import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/provider/order_list.dart';

import '../widgets/drawer_widget.dart';

class OrderHome extends StatelessWidget {
  const OrderHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var orderOf = Provider.of<OrderList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: theme.textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        elevation: 0,
      ),
      drawer: const DrawerWidget(),
      body: ListView.builder(
        itemBuilder: (context, i) {
          var order = orderOf.order[i].cart[i];
          var date = DateFormat.yMMMd().format(
            orderOf.order[i].createdDate,
          );
          return Card(
            color: Theme.of(context).primaryColorLight,
            child: ListTile(
              leading: Chip(
                label: Text(
                  '\$ ${(order.price * order.qty).toStringAsFixed(2)}',
                ),
              ),
              title: Text(order.title),
              subtitle: Text(
                '\$ ${order.price} * ${order.qty}x \n$date',
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => orderOf.removeOrder(orderOf.order[0].id),
              ),
            ),
          );
        },
        itemCount: orderOf.order.length,
      ),
    );
  }
}
