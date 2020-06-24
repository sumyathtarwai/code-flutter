import 'package:flutter/material.dart';
import '../provider/modal.dart';
import '../provider/product.dart';

import 'color_grid_widget.dart';
import 'image_widget.dart';

class CartEditModal extends StatefulWidget {
  final ScrollController scrollController;
  final Product product;
  final Cart cart;
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
    var length = widget.product.displayQty;
    var qtyList = List.generate(length, (i) => i + 1);

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
              Expanded(
                flex: 2,
                child: Container(
                  // height: 200,
                  child: ImageWidget(
                      imagePath: widget.product.imageUrl,
                      borderRadius: BorderRadius.zero),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        rowTitle(
                          leading: Text('Quantity: '),
                          trailig: DropdownButton(
                            value: selectedItem,
                            dropdownColor: Theme.of(context).primaryColorLight,
                            onChanged: (val) =>
                                setState(() => selectedItem = val),
                            items: qtyList.map(
                              (item) {
                                return DropdownMenuItem(
                                  child: Text('$item'),
                                  value: item,
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        rowTitle(
                          leading: Text('Color: '),
                          trailig: ColorGridBar(
                            colorList: widget.product.color,
                            onDoubleTap: () => {},
                          ),
                        ),
                        rowTitle(
                          leading: Text('Size: '),
                          trailig: Text('${widget.product.sizeName}'),
                        ),
                        rowTitle(
                          leading: Text('Price: '),
                          trailig: Text('${widget.product.price}'),
                        ),
                        rowTitle(
                          leading: Text('Subtotal: '),
                          trailig: Text(
                              '${widget.cart.subTotal.toStringAsFixed(2)}'),
                        ),
                        RaisedButton(
                          onPressed: () => {},
                          child: Text('Add To Cart',
                              style: Theme.of(context).textTheme.button),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
