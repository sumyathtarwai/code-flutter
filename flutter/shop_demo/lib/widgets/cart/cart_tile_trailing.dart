import 'package:flutter/material.dart';
import '../common/common_part_export.dart';

import '../../provider/modal.dart';
import 'cart_part_export.dart';

class Trailing extends StatelessWidget {
  const Trailing({
    Key key,
    @required this.product,
    @required this.text,
    @required this.cart,
  }) : super(key: key);

  final ProductItem product;
  final TextTheme text;
  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              product.title,
              style: text.subtitle1,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Quantity: ${cart.qty}',
              style: text.bodyText1,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Subtotal: \$${cart.subTotal.toStringAsFixed(2)}',
              style: text.bodyText1,
            ),
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Theme.of(context).buttonColor,
            ),
            onPressed: () {
              showFloatingModalBottomSheet(
                context: context,
                builder: (context, scrollController) => CartEditModal(
                  scrollController: scrollController,
                  product: product,
                  cart: cart,
                ),
              );
            },
            child: Text(
              'Edit Detail',
            ),
          )
        ],
      ),
    );
  }
}
