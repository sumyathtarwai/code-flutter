import 'package:flutter/material.dart';
import 'package:shop_demo/widgets/grid_footer.dart';
import 'package:shop_demo/widgets/grid_image.dart';
import '../modal/modal.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: GridBarImage(imagePath: product.imageUrl),
          ),
          Expanded(
            flex: 2,
            child: description(context, product.desc),
          ),

          if (product.color == ColorCode.non)
            Expanded(
              flex: 0,
              child: noSize(),
            ),
          //TODO color list row
          if (product.color != ColorCode.non)
            Expanded(
              flex: 0,
              child: colorPattern(color: product.productColor),
            ),
          Expanded(
            child: sizeTag(context: context, size: product.sizeName),
          ),
          Expanded(
            flex: 2,
            child: GridBarFooter(
              leading: priceTag(context, product.price),
              middle: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () => {},
              ),
              trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart), onPressed: () => {}),
            ),
          ),
        ],
      ),
    );
  }

  Widget description(BuildContext context, String desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        desc,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Widget noSize() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: 20,
      height: 20,
      child: Icon(
        Icons.close,
        color: Colors.red,
        size: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget priceTag(BuildContext context, double price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: FittedBox(
        child: Text(
          '\$ $price',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Widget sizeTag({@required BuildContext context, @required String size}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text(
        size == 'Non' ? '' : size,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(color: Colors.black45),
      ),
    );
  }

  Widget colorPattern({@required Map<String, Object> color}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color['color'],
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
