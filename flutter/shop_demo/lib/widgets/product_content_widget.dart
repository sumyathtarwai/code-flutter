import 'package:flutter/material.dart';
import '../widgets/color_grid_widget.dart';
import '../provider/modal.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    var textOf = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '${product.title}',
              style: textOf.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: Text(
              '${product.desc}',
              style: textOf.bodyText2,
            ),
          ),
          Container(
            height: 30,
            child: ColorGridBar(
              colorList: product.color,
              onDoubleTap: () => {},
            ),
          ),
          rowTitle(
            leading: Text(
              'Size: ',
              style: textOf.bodyText2,
            ),
            trailig: Text(
              '${product.sizeName}',
              style: textOf.bodyText2,
            ),
          ),
          rowTitle(
            leading: Text(
              'Price: ',
              style: textOf.bodyText2,
            ),
            trailig: Text(
              '\$ ${product.price}',
              style: textOf.bodyText2,
            ),
          ),
          rowTitle(
            leading: Text(
              'Qty: ',
              style: textOf.bodyText2,
            ),
            trailig: Text(
              '${product.displayQty}',
              style: textOf.bodyText2,
            ),
          ),
          Divider(),
          rowTitle(
            leading: Text(
              'Subtotal: ',
              style: textOf.subtitle2,
            ),
            trailig: Text(
              '\$ ${product.price * product.displayQty} ',
              style: textOf.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  Widget rowTitle({Widget leading, Widget trailig}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(child: leading),
          Expanded(child: trailig),
        ],
      ),
    );
  }
}
