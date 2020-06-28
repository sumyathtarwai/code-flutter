import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/provider/product_item.dart';
import '../provider/product_list.dart';
import '../widgets/product/admin/admin_product_tile.dart';
import '../widgets/common/common_part_export.dart';

class AdminProductHome extends StatelessWidget {
  const AdminProductHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productOf = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KAIMONO',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.library_add),
            onPressed: () => {},
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Consumer<ProductList>(
          builder: (context, value, child) => ListView.builder(
            itemBuilder: (context, i) => ChangeNotifierProvider<ProductItem>.value(
              value: productOf.products[i],
              builder: (context, child) => AdminProductItem(),
            ),
            itemCount: productOf.products.length,
          ),
        ),
      ),
    );
  }
}
