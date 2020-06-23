import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_tile.dart';

import '../provider/modal.dart';
import '../widgets/cart_order_summary.dart';

class CartHome extends StatelessWidget {
  const CartHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var carts = Provider.of<CartNotifier>(context);
    var products = Provider.of<ProductNotifer>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: theme.textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: OrderSummary(cart: carts),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final prod =
                        products.whereId(carts.cartList[index].productId);
                    return CartTile(product: prod, cart: carts.cartList[index]);
                  },
                  itemCount: carts.cartList.length,
                  separatorBuilder: (context, index) => Divider(thickness: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
