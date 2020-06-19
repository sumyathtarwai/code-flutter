import 'package:flutter/material.dart';
import '../route.dart';
import '../widgets/product_tile.dart';
import '../modal/modal.dart';

class ProductHome extends StatelessWidget {
  const ProductHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KAIMONO',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () => {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: () => {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => {}),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: dummyProduct.length,
          itemBuilder: (context, i) {
            return InkWell(
              child: ProductTile(product: dummyProduct[i]),
              onTap: () => Navigator.pushNamed(
                context,
                RouteName.productDetail,
                arguments: dummyProduct[i].id,
              ),
            );
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
