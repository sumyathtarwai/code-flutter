import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/modal.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductNotifer>(
      context,
      listen: false,
    ).whereId(id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      body: Container(
        child: Text(product.title),
      ),
    );
  }
}
