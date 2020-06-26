import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/add_to_cart_widget.dart';
import '../widgets/cart_badge_widget.dart';
import '../widgets/color_grid_widget.dart';
import '../widgets/image_widget.dart';
import '../provider/modal.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments;
    var product =
        Provider.of<ProductNotifer>(context, listen: false).whereId(id);

    return ChangeNotifierProvider<Product>.value(
      value: product,
      builder: (context, child) => Consumer<Product>(
        builder: (context, product, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: Theme.of(context).iconTheme,
              title: Text(
                'KAIMONO',
                style: Theme.of(context).textTheme.headline6,
              ),
              elevation: 0,
              actions: <Widget>[
                CartBadge(),
                IconButton(
                  color: Theme.of(context).buttonColor,
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    product.toggleFavorite();
                  },
                ),
              ],
            ),
            body: child,
          );
        },
        child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                  //   height: MediaQuery.of(context).size.width,
                  child: ImageWidget(imagePath: product.imageUrl)),
            ),
            Expanded(
              flex: 2,
              child: Content(product: product),
            ),
            AddToCartButton(product: product),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    var textOf = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '${product.title}',
              style: textOf.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: Text(
              '${product.desc}',
              style: textOf.bodyText2,
            ),
          ),
          Container(
            height: 30,
            child: ColorGridBar(
              colorList: product.color,
              onDoubleTap: () => {},
            ),
          ),
          rowTitle(
            leading: Text(
              'Size: ',
              style: textOf.bodyText2,
            ),
            trailig: Text(
              '${product.sizeName}',
              style: textOf.bodyText2,
            ),
          ),
          rowTitle(
            leading: Text(
              'Price: ',
              style: textOf.bodyText2,
            ),
            trailig: Text(
              '\$ ${product.price}',
              style: textOf.bodyText2,
            ),
          ),
          rowTitle(
            leading: Text(
              'Qty: ',
              style: textOf.bodyText2,
            ),
            trailig: Text(
              '${product.displayQty}',
              style: textOf.bodyText2,
            ),
          ),
          Divider(),
          rowTitle(
            leading: Text(
              'Subtotal: ',
              style: textOf.subtitle2,
            ),
            trailig: Text(
              '\$ ${product.price * product.displayQty} ',
              style: textOf.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  Widget rowTitle({Widget leading, Widget trailig}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(child: leading),
          Expanded(child: trailig),
        ],
      ),
    );
  }
}
