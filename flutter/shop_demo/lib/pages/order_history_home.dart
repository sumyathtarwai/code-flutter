import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/common/common_part_export.dart';
import '../widgets/order/order_part_export.dart';
import '../provider/modal.dart';

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
      body: orderOf.order.isEmpty
          ? Center(
              child: Text(
              'No order history yet',
              style: theme.textTheme.headline4,
            ))
          : ListView.builder(
              itemBuilder: (context, i) => OrderTile(order: orderOf.order[i]),
              itemCount: orderOf.order.length,
            ),
    );
  }
}
