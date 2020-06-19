import 'package:flutter/material.dart';
import '../widgets/product_grid_view.dart';

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
        child: ProductGridView(),
      ),
    );
  }
}
