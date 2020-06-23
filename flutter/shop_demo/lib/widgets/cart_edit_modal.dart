import 'package:flutter/material.dart';
import '../provider/modal.dart';
import '../provider/product.dart';

import 'image_widget.dart';

class CartEditModal extends StatelessWidget {
  final ScrollController scrollController;
  final Product product;
  final Cart cart;
  const CartEditModal({
    Key key,
    this.scrollController,
    this.cart,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          bool shouldClose = await showExitDialog(context);
          return shouldClose;
        },
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  // height: 200,
                  child: ImageWidget(
                      imagePath: product.imageUrl,
                      borderRadius: BorderRadius.zero),
                ),
              ),
              Expanded(
                flex: 3,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text('Quantity'),
                            Text('${cart.qty}'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text('Color'),
                            Text('${product.color}'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text('Size'),
                            Text('${product.sizeName}'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text('Price'),
                            Text('${cart.price}'),
                            Text('Subtotal'),
                            Text('${cart.subTotal.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                      RaisedButton(
                        onPressed: () => {},
                        child: Text('Add To Cart',
                            style: Theme.of(context).textTheme.button),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showExitDialog(BuildContext context) async {
    bool shouldClose = true;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Would you like to exit?',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              shouldClose = true;
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              shouldClose = false;
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
    return shouldClose;
  }
}
