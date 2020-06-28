import 'package:flutter/material.dart';
import '../common/common_part_export.dart';

import '../../provider/modal.dart';

class CartEditModal extends StatefulWidget {
  final ScrollController scrollController;
  final ProductItem product;
  final CartItem cart;
  const CartEditModal({
    Key key,
    this.scrollController,
    this.cart,
    this.product,
  }) : super(key: key);

  @override
  _CartEditModalState createState() => _CartEditModalState();
}

class _CartEditModalState extends State<CartEditModal> {
  var selectedItem;

  @override
  void initState() {
    selectedItem = widget.cart?.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var length = widget.product.displayQty;
    //var qtyList = List.generate(length, (i) => i + 1);

    return Material(
      child: WillPopScope(
        onWillPop: () async {
          bool shouldClose = await showExitDialog(context);
          return shouldClose;
        },
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                // height: 200,
                child: ImageWidget(imagePath: widget.product.imageUrl),
              ),
              ProductContent(product: widget.product),
              AddToCartButton(product: widget.product),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showExitDialog(BuildContext context) async {
    bool shouldClose = true;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Would you like to exit?',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              shouldClose = true;
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              shouldClose = false;
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
    return shouldClose;
  }

  Widget rowTitle({Widget leading, Widget trailig}) {
    return Expanded(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leading,
          trailig,
        ],
      ),
    );
  }
}
