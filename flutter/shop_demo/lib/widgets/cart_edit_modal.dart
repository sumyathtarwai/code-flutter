import 'package:flutter/material.dart';
import 'package:shop_demo/widgets/add_to_cart_widget.dart';
import 'package:shop_demo/widgets/product_content_widget.dart';
import '../provider/modal.dart';
import '../provider/product.dart';


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
              // Expanded(
              //   flex: 3,
              //   child: Container(
              //     padding: const EdgeInsets.all(10),
              //     child: Form(
              //       child: Column(
              //         children: <Widget>[
              //           rowTitle(
              //             leading: Text('Quantity: '),
              //             trailig: DropdownButton(
              //               value: selectedItem,
              //               dropdownColor: Theme.of(context).primaryColorLight,
              //               onChanged: (val) =>
              //                   setState(() => selectedItem = val),
              //               items: qtyList.map(
              //                 (item) {
              //                   return DropdownMenuItem(
              //                     child: Text('$item'),
              //                     value: item,
              //                   );
              //                 },
              //               ).toList(),
              //             ),
              //           ),
              //           // (widget.product.color == null ||
              //           //         widget.product.color?.first == ColorCode.non)
              //           //     ? Expanded(child: ColorNonIcon())
              //           //     : Expanded(
              //           //         child: rowTitle(
              //           //           leading: Text('Color: '),
              //           //           // FIXME
              //           //           trailig: Container(
              //           //             height: 30,
              //           //             child: ColorGridBar(
              //           //               colorList: widget.product.color,
              //           //               onDoubleTap: () => {},
              //           //             ),
              //           //           ),
              //           //         ),
              //           //       ),
              //           rowTitle(
              //             leading: Text('Size: '),
              //             trailig: Text('${widget.product.sizeName}'),
              //           ),
              //           rowTitle(
              //             leading: Text('Price: '),
              //             trailig: Text('${widget.product.price}'),
              //           ),
              //           rowTitle(
              //             leading: Text('Subtotal: '),
              //             trailig: Text(
              //                 '${widget.cart.subTotal.toStringAsFixed(2)}'),
              //           ),
              //           AddToCartButton(product: widget.product),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
