import 'package:flutter/material.dart';

//import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//import 'package:provider/provider.dart';
import '../../../provider/modal.dart';
import '../../../widgets/common/common_part_export.dart';
import 'product_form.dart';

class ProductUpdate extends StatelessWidget {
  final ScrollController scrollController;
  final ProductItem product;
  const ProductUpdate({Key key, this.product, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          return await Util.showExitDialog(context);
        },
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              product != null
                  ? Container(
                      // height: 200,
                      child: ImageWidget(imagePath: product.imageUrl),
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
              Expanded(child: ProductEditForm(product: product)),
            ],
          ),
        ),
      ),
    );
  }
}
