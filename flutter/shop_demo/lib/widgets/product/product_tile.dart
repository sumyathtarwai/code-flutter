import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/common_part_export.dart';
import '../../route.dart';

import '../../provider/modal.dart';
import 'grid_footer.dart';

class ProductTile extends StatelessWidget {
  // final Product product;
  const ProductTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductItem>(context);
    final cart = Provider.of<CartList>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: InkWell(
              child: ImageWidget(
                imagePath: product.imageUrl,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              onTap: () => Navigator.pushNamed(
                context,
                RouteName.productDetail,
                arguments: product.id,
                // arguments:
                //     ChangeNotifierProvider<Product>.value(value: product),
              ),
            ),
          ),
          Expanded(
            child: _description(context, product.title),
          ),
          if (product.color == null || product.color?.first == ColorCode.non)
            Expanded(child: ColorNonIcon()),

          if (product.color != null && product.color?.first != ColorCode.non)
            Expanded(
              child: ColorGridBar(
                colorList: product.color,
                onDoubleTap: () => {},
              ),
            ),
          //TODO size list row
          Expanded(
            child: _sizeTag(context: context, size: product.sizeName),
          ),
          Expanded(
            flex: 2,
            child: Footer(
              leading: _priceTag(context, product.price),
              middle: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () => product.toggleFavorite(),
              ),
              // TODO qty selection
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cart.addToCart(
                    CartItem(
                        id: DateTime.now().toString(),
                        productId: product.id,
                        title: product.title,
                        price: product.price,
                        // FIXME Color
                        color: ColorCode.red,
                        // FIXME qty
                        qty: 1),
                  );
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColorDark,
                      content: Text(
                        'Successfully Added to Cart!',
                      ),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () => cart.removeCurrent(product.id),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _description(BuildContext context, String desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        desc,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _priceTag(BuildContext context, double price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: FittedBox(
        child: Text(
          '\$ $price',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Widget _sizeTag({@required BuildContext context, @required String size}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text(
        size == 'Non' ? '' : size,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(color: Colors.black45),
      ),
    );
  }
}
