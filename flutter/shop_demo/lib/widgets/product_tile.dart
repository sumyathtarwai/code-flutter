import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../route.dart';
import '../widgets/color_non_widget.dart';
import '../widgets/color_grid_widget.dart';
import '../widgets/grid_footer.dart';
import '../widgets/image_widget.dart';
import '../provider/modal.dart';

class ProductTile extends StatelessWidget {
  // final Product product;
  const ProductTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartNotifier>(context, listen: false);
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
              child: ColorGridBar(colorList: product.color),
            ),
          //TODO size list row
          Expanded(
            child: _sizeTag(context: context, size: product.sizeName),
          ),
          Expanded(
            flex: 2,
            child: Consumer<Product>(
              builder: (context, prod, child) => Footer(
                leading: _priceTag(context, prod.price),
                middle: IconButton(
                  icon: Icon(
                    prod.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    prod.toggleFavorite();
                  },
                ),
                // TODO qty selection
                trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () => cart.addToCart(
                    Cart(
                        id: DateTime.now().toString(),
                        productId: prod.id,
                        title: prod.title,
                        price: prod.price,
                        // FIXME Color
                        color: ColorCode.red,
                        qty: 1),
                  ),
                ),
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
