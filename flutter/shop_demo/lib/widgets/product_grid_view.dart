import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/modal.dart';
import '../widgets/product_tile.dart';

class ProductGridView extends StatelessWidget {
  final showOnlyFavorite;

  const ProductGridView({
    Key key,
    @required this.showOnlyFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contain = Provider.of<ProductNotifer>(context, listen: false);
    var products =
        showOnlyFavorite ? contain.favoritesProducts : contain.products;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider<ProductItem>.value(
          builder: (context, child) => ProductTile(),
          value: products[i],
          // child: ProductTile(
          //     //product: products[i]
          //     ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
    );
  }
}
