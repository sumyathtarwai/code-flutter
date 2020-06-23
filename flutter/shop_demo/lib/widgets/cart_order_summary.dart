import 'package:flutter/material.dart';
import '../provider/modal.dart';

class OrderSummary extends StatelessWidget {
  final CartNotifier cart;
  const OrderSummary({
    Key key,
    this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var text = theme.textTheme;

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
                    '\$ ${cart.total}',
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
              onPressed: () => {},
              child: Text(
                'Checkout',
                style: text.button,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
