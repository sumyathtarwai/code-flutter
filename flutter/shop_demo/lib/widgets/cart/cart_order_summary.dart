import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/modal.dart';

class OrderSummary extends StatefulWidget {
  final Function callback;
  final CartList cart;
  const OrderSummary({
    Key key,
    this.cart,
    this.callback,
  }) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var text = theme.textTheme;
    var cart = Provider.of<CartList>(context, listen: false);
    var order = Provider.of<OrderList>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Order Summary',
                    style: text.subtitle1,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${cart.totalQty} Items',
                    style: text.subtitle1,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Order Total',
                    style: text.subtitle1,
                  ),
                ),
                Expanded(
                  child: Text(
                    '\$ ${cart.total.toStringAsFixed(2)}',
                    style: text.subtitle1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RaisedButton(
              color: theme.buttonColor,
              onPressed: _isLoading
                  ? null
                  : () async {
                      _loading(true);
                      await order.addOrder(cart.cartList, cart.total);

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColorDark,
                          content: Text(
                            'Successfully Ordered!',
                          ),
                        ),
                      );

                      _loading(false);
                      cart.clearCart();
                    },
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      'Checkout',
                      style: text.button,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  _loading(bool val) {
    if (mounted) {
      setState(() {
        _isLoading = val;
      });
    }
  }
}
