import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/pages.dart';
import '../provider/modal.dart';
import '../widgets/image_widget.dart';

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
        Provider.of<CartNotifier>(context, listen: false).removeCart(cart);
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
}

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
