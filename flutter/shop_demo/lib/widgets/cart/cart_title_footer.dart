import 'package:flutter/material.dart';
import '../../provider/modal.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    @required this.cart,
    @required this.text,
    @required this.product,
  }) : super(key: key);

  final CartItem cart;
  final TextTheme text;
  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Color: ${ProductItem.getProductColor(cart.color)['name']}',
              style: text.bodyText2,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Size: ${product.sizeName}',
              style: text.bodyText2,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Price: ${product.price}',
              style: text.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
