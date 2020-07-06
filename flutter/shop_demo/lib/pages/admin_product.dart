import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_item.dart';
import '../widgets/product/admin/product_update.dart';
import '../provider/product_list.dart';
import '../widgets/product/admin/admin_product_tile.dart';
import '../widgets/common/common_part_export.dart';

class AdminProductHome extends StatefulWidget {
  const AdminProductHome({Key key}) : super(key: key);

  @override
  _AdminProductHomeState createState() => _AdminProductHomeState();
}

class _AdminProductHomeState extends State<AdminProductHome> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProductList>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var _products = Provider.of<ProductList>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.library_add),
            onPressed: () => showFloatingModalBottomSheet(
              context: context,
              builder: (context, scrollController) =>
                  ProductUpdate(scrollController: scrollController),
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () =>
              Provider.of<ProductList>(context, listen: false).fetchProducts(),
          child: ListView.builder(
            itemBuilder: (context, i) =>
                ChangeNotifierProvider<ProductItem>.value(
              value: _products[i],
              builder: (context, child) => AdminProductItem(),
            ),
            itemCount: _products.length,
          ),
        ),

//         FutureBuilder(
//           future: _futureProduct,
//           builder: (context, AsyncSnapshot<List<ProductItem>> snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemBuilder: (context, i) =>
//                     ChangeNotifierProvider<ProductItem>.value(
//                   value: snapshot.data[i],
//                   builder: (context, child) => AdminProductItem(),
//                 ),
//                 itemCount: snapshot.data.length,
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text(
//                   'There is no item.',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               );
//             }
// // By default, show a loading spinner.
//             return Center(child: CircularProgressIndicator());
//           },
//         ),
      ),
    );
  }
}
