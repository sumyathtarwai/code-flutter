import 'package:flutter/material.dart';
import 'package:shop_demo/widgets/product_tile.dart';
import '../modal/modal.dart';

class ProductHome extends StatelessWidget {
  const ProductHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kaimono',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: dummyProduct.length,
          itemBuilder: (context, i) {
            return ProductTile(product: dummyProduct[i]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
