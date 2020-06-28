import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/common/common_part_export.dart';

import '../provider/modal.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments;
    var product =
        Provider.of<ProductList>(context, listen: false).whereId(id);

    return ChangeNotifierProvider<ProductItem>.value(
      value: product,
      builder: (context, child) => Consumer<ProductItem>(
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
              flex: 3,
              child: Container(
                //  height: MediaQuery.of(context).size.width,
                  child: ImageWidget(imagePath: product.imageUrl)),
            ),
            Expanded(
              flex: 2,
              child: ProductContent(product: product),
            ),
            AddToCartButton(product: product),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
