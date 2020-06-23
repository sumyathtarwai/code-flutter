import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_demo/pages/pages.dart';
import 'package:shop_demo/provider/modal.dart';

class CartDetail extends StatelessWidget {
  const CartDetail({
    Key key,
    @required this.product,
    @required this.cart,
  }) : super(key: key);

  final Product product;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
//TODO different color/size different card
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade400,
                      enabled: true,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
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

  final Product product;
  final TextTheme text;
  final Cart cart;

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
              'Quantity ${cart.qty}',
              style: text.bodyText1,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Subtotal: \$${product.price * cart.qty}',
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

  final Cart cart;
  final TextTheme text;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Color: ${Product.getProductColor(cart.color)['name']}',
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
