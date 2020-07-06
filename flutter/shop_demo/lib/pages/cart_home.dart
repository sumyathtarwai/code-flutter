import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart/cart_part_export.dart';
import '../widgets/common/common_part_export.dart';

import '../provider/modal.dart';

class CartHome extends StatefulWidget {
  const CartHome({Key key}) : super(key: key);

  @override
  _CartHomeState createState() => _CartHomeState();
}

class _CartHomeState extends State<CartHome> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var carts = Provider.of<CartList>(context);
    var products = Provider.of<ProductList>(context, listen: false);

    var fromDrawer = ModalRoute.of(context).isFirst;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: theme.textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return fromDrawer
                ? IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  )
                : IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left, size: 40),
                    onPressed: () => Navigator.of(context).pop(),
                  );
          },
        ),
      ),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: carts.cartList.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'No items in the cart yet.',
                    style: theme.textTheme.headline4,
                  ),
                ),
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: OrderSummary(cart: carts, callback: _loading),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final prod =
                              products.whereId(carts.cartList[index].productId);
                          return CartTile(
                              product: prod, cart: carts.cartList[index]);
                        },
                        itemCount: carts.cartList.length,
                        separatorBuilder: (context, index) =>
                            Divider(thickness: 2),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
