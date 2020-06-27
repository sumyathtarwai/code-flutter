import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/provider/modal.dart';
import '../widgets/drawer_widget.dart';

class OrderHome extends StatelessWidget {
  const OrderHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cart = Provider.of<CartList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order',
          style: theme.textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        elevation: 0,
      ),
      drawer: const DrawerWidget(),
      body: Container(),
    );
  }
}
