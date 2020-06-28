import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_part_export.dart';
import '../common/common_part_export.dart';
import '../../provider/modal.dart';


class CartTile extends StatelessWidget {
  const CartTile({
    Key key,
    @required this.product,
    @required this.cart,
  }) : super(key: key);

  final ProductItem product;
  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
//TODO different color/size different card
    return Dismissible(
      // key shoud be unique
      key: Key(cart.id),
      onDismissed: (_) {
        Provider.of<CartList>(context, listen: false).removeCart(cart);
      },
      confirmDismiss: (direction) {
        return confirmRemove(context);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete_forever,
          size: 50,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.width / 2.5,
                    child: ImageWidget(
                        imagePath: product.imageUrl,
                        borderRadius: BorderRadius.zero),
                  ),
                ),
                Expanded(
                  child: Trailing(product: product, text: text, cart: cart),
                ),
              ],
            ),
          ),
          Footer(cart: cart, text: text, product: product),
        ],
      ),
    );
  }

  Future<bool> confirmRemove(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove This'),
          content: Text('Your cart item will be removed!'),
          actions: <Widget>[
            FlatButton(onPressed: () => true, child: Text('OK')),
            FlatButton(onPressed: () => false, child: Text('Cancel')),
          ],
        );
      },
    );
  }
}
