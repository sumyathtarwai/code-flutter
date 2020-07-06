import 'package:flutter/material.dart';

import '../../../provider/modal.dart';
import '../../../route.dart';
import '../../../widgets/common/common_part_export.dart';
import 'product_form.dart';

class ProductUpdate extends StatefulWidget {
  final ScrollController scrollController;
  final ProductItem product;
  const ProductUpdate({Key key, this.product, this.scrollController})
      : super(key: key);

  @override
  _ProductUpdateState createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          return await Util.showExitDialog(context);
        },
        child: SafeArea(
          top: false,
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    widget.product != null
                        ? Container(
                            // height: 200,
                            child:
                                ImageWidget(imagePath: widget.product.imageUrl),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: Text(
                                'New Product',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ),
                    Expanded(
                      child: ProductEditForm(
                          product: widget.product, loadingCallback: _loading),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void _loading({bool loading, bool pop = false}) {
    if (mounted) {
      setState(() => _isLoading = loading);
    }
    if (pop) {
      Navigator.of(context).popUntil(
        ModalRoute.withName(RouteName.adminProduct),
      );
    } else {
      return;
    }
  }
}
