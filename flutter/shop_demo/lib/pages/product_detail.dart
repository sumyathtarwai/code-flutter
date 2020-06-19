import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      body: Container(
        child: Text(id),
      ),
    );
  }
}
