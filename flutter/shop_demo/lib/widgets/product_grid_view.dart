import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/provider/product_provider.dart';
import '../route.dart';
import '../widgets/product_tile.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductNotifer>(context).products;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, i) {
        return InkWell(
          child: ProductTile(product: products[i]),
          onTap: () => Navigator.pushNamed(
            context,
            RouteName.productDetail,
            arguments: products[i].id,
          ),
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
